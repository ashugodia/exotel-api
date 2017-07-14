module ExotelApi
  class Ivr::CallController < ApplicationController
    skip_before_filter  :verify_authenticity_token
      
    def greeting_and_menu
      begin
        urls = params[:CustomField].titleize.split.join.constantize::Call.greeting_and_menu
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => urls, content_type: "text/html", :status => 200
    end
    
    def dtmf
      begin
        params[:CustomField].titleize.split.join.constantize::Call.find_by_call_sid(params[:CallSid]).update(dtmf: params[:digits].parameterize.to_i)
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => '', content_type: "text/html", :status => 200
    end
    
    def closing
      begin
        urls = params[:CustomField].titleize.split.join.constantize::Call.closing
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => urls, content_type: "text/html", :status => 200
    end
    
    def status
      begin
        params[:CustomField].titleize.split.join.constantize::Call.find_by_call_sid(params[:CallSid]).update(status: params[:Status])
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => '', content_type: "text/html", :status => 200
    end
  end
end