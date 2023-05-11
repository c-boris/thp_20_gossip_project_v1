class CitiesController < ApplicationController

  def show
    @colors = ["blue", "green", "brown", "purple", "orange"]
    @city = City.find_by(id: params[:id])
  end

end