class Event < ActiveRecord::Base
  include IceCube
  serialize :schedule, Hash

  attr_accessible :duration, :frequency

  def schedule=(new_schedule)
    @schedule = new_schedule
    write_attribute(:schedule_text, new_schedule.to_hash)
  end

  def schedule
    @schedule ||= Schedule.from_hash(read_attribute(:schedule_text))
  end

end
