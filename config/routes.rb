Rails.application.routes.draw do
 root :to => 'links#index'
  resources :links do
    member do
      get :upvote
      patch :upvote
    end
    resources :comments
  end
end
