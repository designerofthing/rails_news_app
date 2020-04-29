Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'
  get 'articles/:id/edit', to: 'articles#edit', as: :edit_article
  patch 'articles/:id', to: 'articles#update'
  delete 'users/sign_out', to: 'devise/sessions#destroy'
  root controller: :articles, action: :index
  resources :articles
end