Rails.application.routes.draw do
  namespace :admin do
    root to: 'mains#home'

    resource :main, only: %i() do
      collection do
        get :home
      end
    end
    resources :resources
  end

end
