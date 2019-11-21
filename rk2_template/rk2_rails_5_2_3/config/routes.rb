Rails.application.routes.draw do
  root 'main#index'
  get 'main/index', :as => 'index'
  get 'main/result', :as => 'result'
end
