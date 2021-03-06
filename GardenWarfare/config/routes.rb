Rails.application.routes.draw do
  namespace :api, defaults: { format: "json"  }  do
    namespace :v1 do
      resources :users, only: [:create]
      resources :characters, except: [:new, :edit]
      resources :items, except: [:new, :edit]
    end
  end  

end
