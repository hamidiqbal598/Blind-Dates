Rails.application.routes.draw do


  root to: 'blind_dates#index'

  resources :blind_dates do
    collection do
      get :past_dates, action: 'index'
    end
  end
  resources :teams
  devise_for :employees

  devise_scope :employee do
    get '/employees/sign_out' => 'devise/sessions#destroy'
  end
  resources :employees

  # root to: "home#index"
  get '/:any_other_url', to: 'redirects#employees'

end
