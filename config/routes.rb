Rails.application.routes.draw do
  devise_for :admins, only: [:sign_in, :sign_out, :session],controllers: {
   sessions: 'admins/sessions'
  }
  namespace :admins do
    root to:'homes#about'
  end
  devise_for :customers
  root to:'homes#top'
  get '/about' => 'homes#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

