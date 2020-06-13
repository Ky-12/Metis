Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'articles#index'
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions:      'users/sessions',
}
  get 'user/index' => 'users#index'
  get 'user/:id/show' => 'users#show'
  get 'user/:id/edit' => 'users#edit'
  post "user/:id/update" => "users#update"

  #記事について
  get 'article/index' => 'articles#index'
  get 'article/:id/show' => 'users#show'
  post "article/:id/update" => "articles#update"
  get "article/:id/edit" => "articles#edit"
  post "article/:id/destroy" => "articles#destroy"
  get 'article/new' => "articles#new"
  post "article/create" => "articles#create"
end
