Rails.application.routes.draw do
  root 'tops#top'

  get 'terms', to: 'tops#terms'
  get 'privacy_policy', to: 'tops#privacy_policy'
  get 'treatment', to: 'tops#treatment'

  get 'my_page', to: 'users#my_page'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'

  get 'new_guest', to: 'users#new_guest'
  
  resources :users, only: %i[new create destroy]
  resources :plots, shallow: true do
    resources :eighteen_lines
    resources :cards
    resources :characters
    resources :foreshadowings
    resources :timelines
  end
end