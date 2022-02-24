Rails.application.routes.draw do
  root to: 'public/homes#top'
  get '/admin' => 'admin/homes#top'
  get '/about' => 'public/homes#about'


  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "customers/registrations",
  sessions: 'customers/sessions'
}

  devise_for :admins, only: [:sign_in, :sign_out, :session],controllers: {
   sessions: 'admins/sessions'
  }


  scope module: :public do
   resources :addresses,except: [:new, :show]
  end

  scope module: :public do
   post '/orders/confirm'=>'orders#confirm'
   get '/orders/complete'=>'orders#complete'
   resources :orders,only: [:index, :new, :show, :create,:destroy]

  end

  scope module: :public do
   delete '/cart_items/destroy_all'
   resources :cart_items,only: [:index, :update , :destroy, :create]
  end

  scope module: :public do
   get '/customers/my_page' => 'customers#show'
   get '/customers/edit_page' =>'customers#edit'
   get   '/customers/unsubscribe'
   patch '/customers/withdraw'
   patch '/customers/update'
   put '/customers/update'

   # resource :customers,only: [:update]

  end

  scope module: :public do
   resources :items,only: [:show, :index]
  end

  namespace :admin do
   resources :orders,only: [:show, :update]
  end
  namespace :admin do
   resources :customers,only: [:index, :show, :edit, :update]
  end
  namespace :admin do
   resources :genres,only: [:index, :create, :edit, :update]
  end

  namespace :admin do
  resources :items,except: [:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

