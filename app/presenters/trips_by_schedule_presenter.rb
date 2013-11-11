class TripsBySchedulePresenter
  attr_reader :schedules

  def initialize(schedules)
    @schedules = schedules
  end

  def as_json(*args)
    json = {}

    schedules.each do |s|
      name = Trip.where(id: s.trip_id).first.name
      schedule = SchedulePresenter.new(s).as_json
      if json[name]
        json[name] << schedule
      else
        json[name] = [schedule]
      end
    end

    json
  end
end
