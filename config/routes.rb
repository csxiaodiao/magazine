Rails.application.routes.draw do
  
  devise_for :accounts, controllers: {
    sessions: 'admin/sessions'
  }, only: [:sessions]
  
  namespace :admin do
  
    root to: 'mains#home'

    resource :main, only: %i() do
      collection do
        get :home
      end
    end

    resources :articles
    resources :resources
  end

end
