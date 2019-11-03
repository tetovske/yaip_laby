Rails.application.routes.draw do
  root 'main#index'
  get 'main/result' => 'main#result', :as => 'result'
  get 'main/index' => 'main#index', :as => 'index'
end
