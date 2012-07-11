Harvestgeek::Application.routes.draw do
  

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
	
	
	
	
	match "/:controller/:action", :to => ":controller#:action"
	 
	
end
