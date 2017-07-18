Rails.application.routes.draw do
  namespace :exotel_api do
    namespace :ivr do
      namespace :call do
        get 'greeting_and_menu'
        get 'dtmf'
        get 'closing'
        post 'status'
      end
    end
  end
end
