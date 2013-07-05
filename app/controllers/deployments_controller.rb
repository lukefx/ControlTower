class DeploymentsController < ApplicationController

  def create
    @server = params[:server_id]
    @application = params[:application_id]
    @revision = params[:revision_id]
    
  end

end
