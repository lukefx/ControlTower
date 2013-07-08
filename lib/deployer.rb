module Deployer

  class RemoteDeployer

    def self.deploy(server, application, revision=nil)
      Net::SSH.start(server.ip, server.username, password: server.password) do |ssh|
        @revision = application.revisions.last # parametrize this with revision
        ssh.scp.upload!(@revision.deployable.path, "#{@revision.deployable_file_name}")
        ssh.exec!("sudo cp #{@revision.deployable_file_name} #{server.remote_path}")
        ssh.exec!("sudo chown jboss:jboss #{server.remote_path}/#{@revision.deployable_file_name}")
      end
    end

    def self.list_deployments(server)
      Net::SSH.start(server.ip, server.username, password: server.password) do |ssh|
        ssh.exec!("find '#{server.remote_path}' -iregex '.*\\(war\\|ear\\)' -printf '%f,'").split(',')
      end
    end

  end

end