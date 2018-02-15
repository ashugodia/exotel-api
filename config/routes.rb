Rails.application.routes.draw do
  namespace :exotel_api do
    namespace :call do
      get 'greeting'
      get 'after_greeting'
      get 'ivr_menu'
      get 'keypress'
      get 'after_keypress'
      get 'after_keypress_greeting'
      get 'play_again'
      post 'finish'
    end
  end
end
