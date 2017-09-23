module ExotelApi
  module Call
    class AfterDtmfController < StartController
      #response - list of URLs
      def greeting
        begin
          _call = direction
          if _call.present?
            urls = _call.greeting(params) if defined?(_call.greeting)
          end
        rescue => e
          logger.error e.message
          logger.error e.backtrace.join("\n")
        end
        render :plain => urls, content_type: "text/plain", :status => 200
      end
      #response - menu
      def after_greeting
        begin
          _call = direction
          if _call.present?
            applet = "{\"select\":\"#{_call.after_greeting(params)}\"}" if defined?(_call.after_greeting)
          end
        rescue => e
          logger.error e.message
          logger.error e.backtrace.join("\n")
        end
        render :plain => applet, content_type: "text/html", status: 200
      end
      #response - phones
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
