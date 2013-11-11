class Schedule < ActiveRecord::Base
  belongs_to :trip

  validates_presence_of :trip_id, :price, :wdays, :time

  # TODO how to test inclusion of
  # require the wday value to be in between 0 (Sunday) to 6 (Saturday)
  # validates :wdays, inclusion: { in: [0, 1, 2, 3, 4, 5, 6] }
end
