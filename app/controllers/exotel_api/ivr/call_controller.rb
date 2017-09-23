module ExotelApi
  class Ivr::CallController < ApplicationController
    skip_before_filter  :verify_authenticity_token
    def greeting_and_menu
      begin
        _call = direction
        if _call.present?
          _call.update(status: 'completed')
          urls = _call.greeting_and_menu if defined?(_call.greeting_and_menu)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => urls, content_type: "text/plain", :status => 200
    end

    def dtmf
      begin
        _call = direction
        if _call.present?
          _call.update(dtmf: params[:digits].parameterize.to_i)
          _call.dtmf_callback(params) if defined?(_call.dtmf_callback)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => '', content_type: "text/plain", :status => 200
    end

    def closing
      begin
        _call = direction
        urls = _call.closing if _call.present? and defined?(_call.closing)
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => urls, content_type: "text/plain", :status => 200
    end

    def status
      begin
        _call = direction
        if _call.present?
          _call.update(status: params[:Status])
          _call.status_callback(params) if defined?(_call.status_callback)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => '', content_type: "text/plain", :status => 200
    end

    def repeat
      begin
        _call = direction
        if _call.present?
          status = _call.repeat_callback(params) if defined?(_call.repeat_callback)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => '', content_type: "text/plain", :status => status
    end

    private
    def find_call
      if params[:CustomField].present?
        params[:CustomField].titleize.split.join.constantize::Call.find_by_call_sid(params[:CallSid])
      else
        eval(ExotelApi.status_callback_query)
      end
    end
    def direction
      if params[:Direction] == 'incoming'
        eval(ExotelApi.inbound_query)
      else
        find_call
      end
    end
  end
end
