module ExotelApi
  module Call
    module AfterGreeting
      class ConnectController < StartController
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
      end
    end
  end
end
