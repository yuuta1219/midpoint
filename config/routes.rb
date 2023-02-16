Rails.application.routes.draw do
  root 'tops#top'

  get 'terms', to: 'tops#terms'
  get 'privacy_policy', to: 'tops#privacy_policy'
  get 'treatment', to: 'tops#treatment'
  get 'my_page', to: 'tops#my_page'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :plots, shallow: true do
    resources :eighteen_lines
    resources :cards
    resources :characters
    resources :foreshadowings
    resources :boards
  end
end