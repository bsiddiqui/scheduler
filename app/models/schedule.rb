class Schedule < ActiveRecord::Base
  belongs_to :trip

  validates_presence_of :trip_id, :price, :wdays, :time
  validate :valid_wdays

  # require the wday value to be in between 0 (Sunday) to 6 (Saturday)
  def valid_wdays
    if wdays.detect { |d| !(0..6).include?(d) }
      errors.add(:wdays, :invalid)
    end
  end
end
