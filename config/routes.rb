Rails.application.routes.draw do

  root to: 'shopping_lists#index'

  resources :shopping_lists do
    resources :items
  end

end
