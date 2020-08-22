Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :dump_data, defaults: { format: :json } do
    post 'create_store'
    post 'create_book'
    post 'create_open_time'
    post 'create_user'
    post 'create_trans'
  end 
end
