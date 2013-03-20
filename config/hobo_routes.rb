# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Functionality::Application.routes.draw do


  # Resource routes for controller functions
  resources :functions, :only => [:new, :edit, :show, :create, :update, :destroy]

  # Owner routes for controller functions
  resources :sub_systems, :as => :sub_system, :only => [] do
    resources :functions, :only => [] do
      get 'new', :on => :new, :action => 'new_for_sub_system'
      collection do
        post 'create', :action => 'create_for_sub_system'
      end
    end
  end


  # Resource routes for controller function_types
  resources :function_types


  # Resource routes for controller sub_systems
  resources :sub_systems


  # Resource routes for controller users
  resources :users, :only => [:edit, :show, :create, :update, :destroy] do
    collection do
      post 'signup', :action => 'do_signup'
      get 'signup'
    end
    member do
      get 'account'
      put 'activate', :action => 'do_activate'
      get 'activate'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller users
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'

  namespace :admin do


    # Resource routes for controller admin/users
    resources :users

  end

end
