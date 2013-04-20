class ApplicationController < ActionController::Base
  protect_from_forgery


  START_DAY = :sunday
  
  before_filter :define_date_range

  def define_date_range
    if params[:date].present?
      @date = Date.parse params[:date]
    else
      @date = Date.today
    end
    
    if params[:mode] == :weekly
      @first_day = @date.beginning_of_week(START_DAY)
      @last_day  = @date.end_of_week(START_DAY)
    else
      @first_day = @date.beginning_of_month.beginning_of_week(START_DAY)
      @last_day  = @date.end_of_month.end_of_week(START_DAY)
    end
  end
end
