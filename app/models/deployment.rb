class Deployment < ActiveRecord::Base

  belongs_to :server
  belongs_to :application

  def self.deploy(deployment)
    Deployer::RemoteDeployer.deploy(deployment.server, deployment.application, deployment.number)
  end

  def self.undeploy(deployment)
    Deployer::RemoteDeployer.undeploy(deployment.server, deployment.application)
  end

end
