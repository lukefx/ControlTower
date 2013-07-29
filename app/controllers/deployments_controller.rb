class DeploymentsController < ApplicationController

  def create

    @deployment = Deployment.where(deployment_params.except(:number)).first_or_create do |d|
      d.number = params[:deployment][:number]
    end

    Deployment.deploy(@deployment)

  end

  def destroy
    @deployment.destroy
  end

  private

  def set_application
    @deployment = Deployment.where(deployment_params.except(:number))
  end

  def deployment_params
    params.require(:deployment).permit(:server_id, :application_id, :number)
  end

end
