class Participation < ActiveRecord::Base
  belongs_to :application
  belongs_to :participant

  validates_uniqueness_of :participant_id, :scope => :application_id

end
