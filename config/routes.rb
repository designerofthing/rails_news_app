Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/:id/edit', to: 'articles#edit', as: :edit_article
  patch 'articles/:id', to: 'articles#update'
  root controller: :articles, action: :index
  resources :articles
end
