class GossipsController < ApplicationController

  def index
    @colors = ["blue", "green", "brown", "purple", "orange"]
    @users = User.all
    @titles = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = User.find(@gossip.user_id)
  end

  def new
    @gossip = Gossip.new()
  end

  def create
    @gossip = Gossip.new(title: params['title'], content: params['content'], user_id: current_user.id)

    if @gossip.save
      flash[:success] = "Le potin a bien été créé !"
      redirect_to '/'
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find_by(id: params[:id])
  end

  def update
    @gossip = Gossip.find_by(id: params[:id])
    params_permitted = params.require(:gossip).permit(:title, :content)

    if @gossip.update(params_permitted)
      flash[:success] = "Le potin a été mis à jour !"
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find_by(id: params[:id])
    
    if (GossipTag.find_by(id: params[:id]) != nil)
      GossipTag.find_by(id: params[:id]).destroy
    end

    Comment.all.each { |c| 
    if c.gossip_id == params[:id]
       c.destroy
      end
    }

    @gossip.destroy
    flash[:success] = "Le potin a été détruit !"
    redirect_to '/'
  end

end