class Application < ActiveRecord::Base
  belongs_to :account
  has_many :participations
  has_many :participants, :through => :participations
  
  validates_presence_of :app_id
  validates_uniqueness_of :app_id
end
