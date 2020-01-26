Rails.application.routes.draw do
  root 'main#index', :as => 'root'

  get 'admin/handling', :as => 'handle'
  get 'admin/res', :as => 'res'

  get 'main/result' => 'main#result', :as => 'result'
  get 'main/index' => 'main#index', :as => 'index'
end
