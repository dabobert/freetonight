class HomesController < ApplicationController

  def show
    @availability     = Availability.first
    @date             = Time.now.to_date

    @availabilities = Availability.order(:start_date_time).collect do |availability|
      ((availability.start_i)..(availability.end_i))
    end.intersperse "xxx"
  end
end
