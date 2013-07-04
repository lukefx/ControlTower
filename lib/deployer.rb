module Deployer

  class RemoteDeployer

    def self.deploy(server, app)
      Net::SSH.start(server.ip, server.username, password: server.password) do |ssh|
        # ssh.scp.upload!(app.deployable.path, server.remote_path)
        # puts "#{app.deployable_file_name} -> Triggering deploy..."
        # ssh.exec!("sudo cp #{} /usr/local/jboss/jboss-5.1.0.GA/server/default/deploy")
        # ssh.exec!("sudo chown jboss:jboss /usr/local/jboss/jboss-5.1.0.GA/server/default/deploy/#{}")
      end
    end

    def self.list_deployments(server)
      Net::SSH.start(server.ip, server.username, password: server.password) do |ssh|
        ssh.exec!("find '/usr/local/jboss/jboss-5.1.0.GA/server/default/deploy' -iregex '.*\\(war\\|ear\\)' -printf '%f,'").split(',')
      end
    end

  end

end