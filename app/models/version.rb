class Version < ActiveRecord::Base
  belongs_to :application
  has_many :deployments
  has_many :servers, through: :deployments
  has_attached_file :deployable
end
