module ExotelApi
  class StartController < ApplicationController
    def direction
      if params[:Direction] == 'incoming'
        eval(ExotelApi.inbound_query)
      else
        find_call
      end
    end
    private
    def find_call
      if params[:CustomField].present?
        custom_field = params[:CustomField]
        if request[:controller].present?
          controller_name = request[:controller]
          controller_name = controller_name.gsub("/exotel_api",custom_field)
          controller_name = controller_name.split('/').compact.map {|k| k.titleize.split.join }.join('::')
          controller_name.constantize.find_by_call_sid(params[:CallSid])
        end
      else
        eval(ExotelApi.status_callback_query)
      end
    end
  end
end
