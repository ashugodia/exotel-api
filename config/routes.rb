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
    
    namespace :call do
      get 'start'
      get 'greeting'
      get 'after_greeting'
      namespace :after_greeting do
        get 'connect'
        namespace :connect do
          get 'status'
        end
      end
      get 'connect'
      namespace :connect do
        get 'status'
      end
      post 'finish'
      get 'menu'
      get 'dtmf'
      get 'after_dtmf'
      namespace :after_dtmf do
        get 'greeting'
        get 'after_greeting'
        namespace :connect do
          get 'status'
        end
      end
    end
  end
end
