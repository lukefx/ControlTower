class Application < ActiveRecord::Base

  has_many :deployments
  has_many :servers, through: :deployments

end
