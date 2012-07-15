class CrudTablesController < ApplicationController

# GET /crud_tables
def index
    
end

# GET /crud_tables
def showparams

	@testmessage = "hi!!!!" 

	@message = params[:message] 
	
end

end