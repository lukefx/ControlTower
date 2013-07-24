class DeploymentsController < ApplicationController

  def create
    @deployment = Deployment.where(deployment_params.except(:number)).first
    Deployment.trigger_deploy(@deployment, deployment_params)
  end

  private

  def deployment_params
    params.require(:deployment).permit(:server_id, :version_id )
  end

end
