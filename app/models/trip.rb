class Trip < ActiveRecord::Base
  has_many :schedules

  validates_presence_of :name, :vendor
end
