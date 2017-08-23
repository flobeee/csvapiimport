Rails.application.routes.draw do

    resources :csvapiimports do
      collection { post :import }
    end

    root to: "csvapiimports#index"
  end
