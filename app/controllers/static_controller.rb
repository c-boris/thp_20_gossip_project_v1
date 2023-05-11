class StaticController < ApplicationController

  def index
    @colors = ["blue", "green", "brown", "purple", "orange"]
    @users = User.all
    @titles = Gossip.all
  end
  
  def team
  end

  def contact
  end

  def welcome
    @first_name = params[:first_name]
  end

  def show
    @index = Gossip.find(params[:id])
    @user = User.find(@index.user_id)
  end

  def user
    @user = User.find(params[:index_user])
    @ville = City.find(@user.city_id)
  end

end
