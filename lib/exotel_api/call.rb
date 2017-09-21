module ExotelApi
  class Call < ActiveRecord::Base
    enum status: [ :trigger, :queued, :'in-progress', :completed, :failed, :busy, :'no-answer', :canceled, :unknown, :ringing ]
  end
end
