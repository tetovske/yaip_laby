Rails.application.routes.draw do
  get 'admin/auth' => 'admin#auth', :as => 'authorize'
  get 'admin/handling', :as => 'handle'
  root 'main#index'
  get 'main/result' => 'main#result', :as => 'result'
  get 'main/index' => 'main#index', :as => 'index'
end
