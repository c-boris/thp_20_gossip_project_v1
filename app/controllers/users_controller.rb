class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], 
                    age: params[:age], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation],
                    city_id: City.all.sample.id)
    if @user.save
      @user.authenticate(params[:password])
      flash[:success] = "Compte crée avec succès ! \n Salut à toi, #{@user.first_name} !"
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages[0]
      Rails.logger.info(@user.errors.inspect)
      render 'new'
    end

  end

  def show
    @user = User.find(params['id'])
    @city = City.find(@user.city_id)
  end

end