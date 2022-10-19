Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  devise_for :customers,skip:[:passwords],controllers:{
    sessions:'public/sessions',
    registrations:'public/registrations',
  }

  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:'admin/sessions',
  }

  scope module: :public do
    get '/'=>'homes#top'
    get 'about'=>'homes#about'
    delete 'cart_items/destroy_all'=>'cart_items#destroy_all'

    get 'customers/mypage'=>'customers#show'
    get 'customers/mypage/edit'=>'customers#edit'
    get 'customers/quit'
    patch 'customers/quit'=>'customers#quit_update'
    patch 'customers/mypage'=>'customers#update'

    post 'orders/information'
    get 'orders/complete'
    
    resources :items,only:[:index,:show]
    resources :cart_items,only:[:index,:update,:destroy,:create]
    resources :orders,only:[:new,:create,:index,:show]
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
  end

  namespace :admin do
    get '/'=>'homes#top'
    resources :items,only:[:new,:index,:show,:create,:edit,:update]
    resources :genres,only:[:index,:create,:edit,:update,:destroy]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update]
    resources :order_details,only:[:update]
  end
end
