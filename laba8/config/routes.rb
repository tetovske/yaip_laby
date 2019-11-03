Rails.application.routes.draw do
  root 'main#index'
  get 'main/result' => 'main#result'
  get 'main/index' => 'main#index'
end
