class Release < ActiveRecord::Base

  belongs_to :application
  has_attached_file :deployable
  has_many :deployments
  has_many :servers, through: :deployments

end
