module ExotelApi
  class CallController < StartController
    #response - audio file or list of URLS of audio files
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
    #response - switch case ivr_menu, hangup
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
    #response - audio file or list of URLS of audio files
    def ivr_menu
      begin
        _call = direction
        if _call.present?
          urls = _call.ivr_menu(params) if defined?(_call.ivr_menu)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => urls, content_type: "text/plain", :status => 200
    end
    #response - status 200 and plain ''
    def keypress
      begin
        _call = direction
        if _call.present?
          _call.keypress(params) if defined?(_call.keypress)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => '', content_type: "text/plain", :status => 200
    end
    #response - audio file or list of URLs of audio files
    def after_keypress
      begin
        _call = direction
        if _call.present?
          urls = _call.after_keypress(params) if defined?(_call.after_keypress)
        end
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
      render :plain => urls, content_type: "text/html", status: 200
    end
    #response - status 200, 404 or 302 and plain ''
    def play_again
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
    #response - status 200 and plain ''
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
  end
end
