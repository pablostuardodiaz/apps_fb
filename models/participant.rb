class Participant < ActiveRecord::Base

  #attr_accessor :facebook_id, :facebook_first_name, :facebook_email, :rut, :phone, :address
  
  has_many :participations
  has_many :applications, :through => :participations
  validates_presence_of :facebook_id
  validates_uniqueness_of :facebook_id
end
