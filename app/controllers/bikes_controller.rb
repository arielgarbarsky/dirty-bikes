class BikesController < ApplicationController
  def new
    @bike = Bike.new
  end
end
