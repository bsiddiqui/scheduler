class Schedule < ActiveRecord::Base
  belongs_to :trip

  validates_presence_of :trip_id, :wdays, :time, :price
  validate :price, numericality: { greater_than: 0 }
  validate :max_size, numericality: { greater_than: 0 }
  validate :valid_wdays

  # require the wday value to be in between 0 (Sunday) to 6 (Saturday)
  def valid_wdays
    if wdays.detect { |d| !(0..6).include?(d) }
      errors.add(:wdays, "should be an array of ints represeting days of the week")
    end
  end
end
