class CrudTablesController < ApplicationController

# GET /crud_tables
def index
      redirect_to( :controller => "climates", :action => "index")  
end
 
end