class Deployment < ActiveRecord::Base

  belongs_to :server
  belongs_to :version

  def self.trigger_deploy(deployment, number=nil)
    Deployer::RemoteDeployer.deploy(deployment.server, deployment.application, number)
  end

end
