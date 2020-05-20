class BikesController < ApplicationController
  def new
    @bike = Bike.new
  end

  def index
    @bikes = Bike.all
  end
end
