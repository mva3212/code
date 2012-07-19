Harvestgeek::Application.routes.draw do
  

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
	
	resources :posts
	
	match "/crud_tables/showparams/:message", :to => "crud_tables#showparams"
	match "/journals/:id", :to => "journals#show", :action => :show, :as => "journal"
 
<<<<<<< HEAD
	match "/:controller/:action/", :to => ":controller#:action"
	 
=======
	match "/crud_tables/index", :to => "crud_tables#index"
	
>>>>>>> 7a55a0c67fa28e81466aed1ab7cf06eea13cf074
end
