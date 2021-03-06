FullcalendarAssets::Application.routes.draw do
  resources :teams


  resources :todos  do
      collection { post :sort }
    end



  resources :projects   do
        collection { post :sort }
      end




  resources :eventitems
  resources :projectevents
  resources :users

  resource :calendar, :only => [:show]

  resource :projectcalendar, :only => [:show]


  resources :events
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  root :to => "home#index"

  resources :sessions
  resources :password_resets


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  match 'projectsearch' => 'projects#search'
  match 'myprojects' => 'projects#my_projects'
  match 'mytodos' => 'todos#my_todos'
  match 'projectcopy/:id' => 'projects#copy'
  match 'projects/:action/:title' => 'projects#index'
  match 'project/show_todos/:id' => 'projects#show_todos'
  match 'project/report/:id' => 'projects#report'
  match 'projects/:id' => 'projects#show'
  match 'projects/:id' => 'projects#sort'
  match 'projectevents/new/:id' => 'projectevents#new'
  match 'projectevent/:id' => 'projectevents#showmilestone'
  match 'todos/new/:id' => 'todos#new'
  match 'todo/:id' => 'todos#show'

  # match 'project/:id/edit' => 'projects#edit'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
