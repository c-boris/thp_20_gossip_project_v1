class LikesgossipController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    puts params[:gossip_id]

    @like = Like.new(user_id: current_user.id, likeable_id: params[:gossip_id], likeable_type: "Gossip", gossip_id: params[:gossip_id])

    if (@like.save)
      redirect_back(fallback_location: root_path)
      Rails.logger.info(@like.errors.inspect)
    end

  end

  def destroy
    @like = Like.find_by(gossip_id: params[:id], user_id: current_user.id)
    if (@like.destroy)
      redirect_back(fallback_location: root_path)
      Rails.logger.info(@like.errors.inspect)
    end
  end
  
end