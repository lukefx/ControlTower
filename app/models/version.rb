class Revision < ActiveRecord::Base
  has_many :deployments
  has_many :servers, through: :deployments
  belongs_to :application
  has_attached_file :deployable

end
