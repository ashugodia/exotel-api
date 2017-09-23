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
        params[:CustomField].titleize.split.join.constantize::Call.find_by_call_sid(params[:CallSid])
      else
        eval(ExotelApi.status_callback_query)
      end
    end
  end
end
