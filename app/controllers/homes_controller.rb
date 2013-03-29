class HomesController < ApplicationController

  def show
    @date = Time.now.to_date
    @articles =[]
    @articles_by_date=[]
  end
end
