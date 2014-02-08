Reviews::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reviews, :defaults => {:format => 'json'}
    end
  end
end
