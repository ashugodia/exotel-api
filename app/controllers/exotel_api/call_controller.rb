module ExotelApi
  class CallController < StartController
    skip_before_filter  :verify_authenticity_token
    #response - greeting,menu,connect
    def start
      begin
        _call = direction
        if _call.present?
          applet = "{\"select\":\"#{_call.start(params)}\"}" if defined?(_call.start)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => applet, content_type: "text/html", status: 200
    end
    #response - list of URLS
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
    #response - menu,connect
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
    #response - nil
    def finish
      begin
        _call = direction
        if _call.present?
          _call.finish(params) if defined?(_call.finish)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => '', content_type: "text/plain", :status => 200
    end
    #response - list of URLS
    def menu
      begin
        _call = direction
        if _call.present?
          urls = _call.menu(params) if defined?(_call.menu)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => urls, content_type: "text/plain", :status => 200
    end
    #response - nil
    def dtmf
      begin
        _call = direction
        if _call.present?
          _call.dtmf_key(params) if defined?(_call.dtmf_key)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => '', content_type: "text/plain", :status => 200
    end
    #response - greeting,connect
    def after_dtmf
      begin
        _call = direction
        if _call.present?
          applet = "{\"select\":\"#{_call.after_dtmf(params)}\"}" if defined?(_call.after_dtmf)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => applet, content_type: "text/html", status: 200
    end
    #response - status code 200,302
    def repeat
      begin
        _call = direction
        if _call.present?
          answer = _call.play_again(params) if defined?(_call.play_again)
          if answer == 'yes'
            status = '200'
          else
            status = '302'
          end
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => '', content_type: "text/plain", :status => status
    end
  end
end
