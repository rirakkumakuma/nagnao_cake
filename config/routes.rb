Rails.application.routes.draw do
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/index'
    get 'orders/new'
    get 'orders/complete'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/index'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end
  namespace :public do
    get 'items/show'
    get 'items/index'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
  end
  root to: 'public/homes#top'
  get '/admin' => 'admin/homes#top'
  get '/about' => 'public/homes#about'
  devise_for :admins, only: [:sign_in, :sign_out, :session],controllers: {
   sessions: 'admins/sessions'
  }

  devise_for :customers


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

