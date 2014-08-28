Rails.application.routes.draw do
 root :to => 'links#index'
  resources :links do
    member do
      get :upvote
      patch :upvote
    end
    resources :comments
  end

  resources :comments do
    resources :comments
  end

end
