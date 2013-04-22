class Event < ActiveRecord::Base
  include IceCube
  serialize :schedule, Hash

  HOUR_HEIGHT = 51

  attr_accessible :duration, :frequency, :name, :schedule

  def schedule=(new_schedule)
    @schedule = new_schedule
    write_attribute(:schedule_text, new_schedule.to_hash)
  end

  def schedule
    @schedule ||= Schedule.from_hash(YAML::load read_attribute(:schedule_text))
  end

end
