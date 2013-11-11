class Schedule < ActiveRecord::Base
  belongs_to :trip

  validates_presence_of :trip_id, :price, :wdays, :time

  # require the wday value to be in between 0 (Sunday) to 6 (Saturday)
  validates_numericality_of :wdays, in: 0..6
end
