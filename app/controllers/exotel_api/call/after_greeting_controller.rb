module ExotelApi
  module Call
    class AfterGreetingController < StartController
      #response - phone
      def connect
        begin
          _call = direction
          if _call.present?
            phones = _call.connect if defined?(_call.connect)
          end
        rescue => e
          logger.error e.message
          logger.error e.backtrace.join("\n")
        end
        render :plain => phones, content_type: "text/plain", :status => 200
      end
    end
  end
end
