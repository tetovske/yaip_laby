Rails.application.routes.draw do
  root 'task#input'
  get 'task/input', :as => 'input'
  get 'task/result', :as => 'result'
end
