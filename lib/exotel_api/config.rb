module ExotelApi
  class << self
    attr_accessor :exotel_sid, :exotel_token, :inbound_query, :status_callback_query

    def configure
      yield self
    end
  end

  class AuthenticationError < StandardError;  end

  class UnexpectedError < StandardError;  end

  class ParamsError < StandardError;  end
end
