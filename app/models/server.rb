class Server < ActiveRecord::Base

  has_many :deployments
  has_many :applications, through: :deployments

end
