# -*- encoding: utf-8 -*-
require 'httparty'
module ExotelApi
  class Metadata
    include HTTParty
    base_uri "https://twilix.exotel.in/v1/Accounts"
    
    def initialize; end
    
    def self.details(params={})
      self.new.details(params)
    end
   
    def details(number)
      response = self.class.get("/#{ExotelApi.exotel_sid}/Numbers/#{number}",  :basic_auth => auth)
      handle_response(response)
    end
    
    protected
    
    def auth
      {:username => ExotelApi.exotel_sid, :password => ExotelApi.exotel_token}
    end
    
    def handle_response(response)
      case response.code.to_i
 	    when 200...300 then ExotelApi::Response.new(response)
      when 401 then raise ExotelApi::AuthenticationError, "#{response.body} Verify your sid and token." 
 	    else
 	      raise ExotelApi::UnexpectedError, response.body
 	    end
    end
  end
end  



