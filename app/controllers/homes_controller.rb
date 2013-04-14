class HomesController < ApplicationController

  def show
    @availability     = Availability.first
    @date             = Time.now.to_date
  end
end
