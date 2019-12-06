Rails.application.routes.draw do
  resources :users

  root 'main#index', :as => 'root'

  get 'admin/auth' => 'admin#auth', :as => 'authorize'
  get 'admin/handling', :as => 'handle'
  get 'admin/res', :as => 'res'

  get 'main/result' => 'main#result', :as => 'result'
  get 'main/index' => 'main#index', :as => 'index'

  get 'session/signin' => 'session#auth', :as => 'signin'
  get 'session/auth' => 'session#authorize_user', :as => 'auth'
  get 'session/signout' => 'session#sign_out', :as => 'signout'
end
