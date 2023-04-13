Rails.application.routes.draw do
  root 'tops#top'

  get 'terms', to: 'tops#terms'
  get 'privacy_policy', to: 'tops#privacy_policy'
  get 'treatment', to: 'tops#treatment'

  get 'my_page', to: 'users#my_page'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'

  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  get 'chats/chat_emotional_value', to: 'chats#chat_emotional_value', defaults: { format: :json }
  
  resources :users, only: %i[new create destroy]
  resources :password_resets, only: %i[new create edit update]
  resources :plots, shallow: true do
    resources :eighteen_lines, only: %i[index create update destroy]
    resources :cards, only: %i[index edit new create update destroy]
    resources :characters
    resources :foreshadowings, only: %i[index create update destroy]
  end
  resources :notifications
  namespace :admin do
    root to: 'dashboards#index'
    resources :users, only: %i[index edit update show destroy]
  end
  resources :tutorials do
    member do
      patch :complete
      patch :start
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end