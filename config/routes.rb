Harvestgeek::Application.routes.draw do
   
  resources :comments

  resources :locations

  authenticated :user do
    root :to => 'home#show'
  end
  root :to => "home#index"
  devise_for :users
	resources :users, :only => [:show, :index] 
	
	resources :users do 
		resources :journals 
	end
	
	resources :posts do
		resources :comments
	end
  
	match "/journals/:id", :to => "journals#show", :action => :show, :as => "journal"
	match "/:controller/edit/:id", :to => ":controller#edit"
	match "/:controller/update/:id", :to => ":controller#update"
	match "/:controller/destroy/:id", :to => ":controller#destroy"
  
	match "/:controller/:action", :to => ":controller#:action"
	 
  
end
