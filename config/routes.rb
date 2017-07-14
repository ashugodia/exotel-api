Rails.application.routes.draw do
  get 'exotel_api/ivr/call/greeting_and_menu' => 'exotel_api/ivr/call/greeting_and_menu'
  get 'exotel_api/ivr/call/dtmf' => 'exotel_api/ivr/call/dtmf'
  get 'exotel_api/ivr/call/closing' => 'exotel_api/ivr/call/closing'
  post 'exotel_api/ivr/call/status' => 'exotel_api/ivr/call/status'
end
