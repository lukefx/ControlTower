class Revision < ActiveRecord::Base

  belongs_to :application
  has_attached_file :deployable

end
