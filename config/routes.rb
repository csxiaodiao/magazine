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

    resources :articles do
      member do
        post :reedit
        post :push_art_to_six
        post :push_art_to_wp
      end
    end

    resources :csv_files, only: %i(index new create destroy) do
      collection do
        post :extract
      end
    end

    resources :resources do
      member do
        post :reedit
      end
      collection do
        post :deduplication
      end
    end

  end

end
