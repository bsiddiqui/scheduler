class SchedulePresenter
  include ActionView::Helpers
  attr_reader :schedule

  def initialize(schedule)
    @schedule = schedule
  end

  def as_json(*args)
    {
      price: schedule.price.to_digits,
      max_size: schedule.max_size,
      time: schedule.time.strftime("%I:%M%p"),
      wdays: schedule.wdays
    }
  end
end
