# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :activities
  resources :disciplines
  resources :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # scope 'disciplines' do
  #   get '/new', to: 'disciplines#new', as: :new_discipline
  #   post '/new', to: 'disciplines#create'
  #   get '/show/:id', to: 'disciplines#show', as: :discipline
  #   get '/', to: 'disciplines#index', as: :disciplines
  #   get '/edit/:id', to: 'disciplines#edit', as: :edit_discipline
  #   patch '/edit/:id', to: 'disciplines#update'
  #   delete '/delete/:id', to: 'disciplines#destroy', as: :delete_discipline

  #   get '/', to: 'disciplines#index', as: :index_discipline
  #   get '/new', to: 'disciplines#new', as: :new_discipline
  #   post '/new', to: 'disciplines#create'
  #   get '/edit/:id', to: 'disciplines#edit', as: :edit_discipline
  #   patch '/edit/:id', to:'disciplines#update'
  #   delete '/delete/:id', to: 'disciplines#destroy', as: :delete_discipline
  # end
end
