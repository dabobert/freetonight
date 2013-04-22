class HomesController < ApplicationController

  def show
    @availability     = Availability.first
    @date             = Time.now.to_date

    #grab events-----------------------------------------
    @events           = Event.all
    @plans            = {}

    @dates = (@first_day..@last_day).to_a
    @dates.each do |day|
      @plans.merge! day => []
      @events.each do |event|
        (@plans[day] << event) if event.schedule.occurs_on?(day)
      end
    end

    #grab availiblities----------------------------------
    @availabilities = Availability.order(:start_date_time).collect do |availability|
      ((availability.start_i)..(availability.end_i))
    end.intersperse "xxx"
  end
end
