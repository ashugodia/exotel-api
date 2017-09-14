module ExotelApi
  module Call
    module AfterGreeting
      class ConnectController < ApplicationController
        #response - nil
        def status
          begin
            _call = direction
            if _call.present?
              _call.status(params) if defined?(_call.status)
            end
          rescue => e
            logger.error e.message
            logger.error e.backtrace.join("\n")
          end
          render :plain => '', content_type: "text/plain", :status => 200
        end
  
        private
        def find_call
          if params[:CustomField].present?
            params[:CustomField].titleize.split.join.constantize::Call::AfterGreeting::Connect.find_by_call_sid(params[:CallSid])
          else
            Call.find_by_call_sid(params[:CallSid])
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
  end
end