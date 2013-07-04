require 'test_helper'

class DeployerTest < ActiveSupport::TestCase

  setup do
    @deployer = Deployer::RemoteDeployer
  end

  test "should list deployments" do
    s = servers(:one)
    assert_not_nil @deployer.list_deployments(s)
  end

end