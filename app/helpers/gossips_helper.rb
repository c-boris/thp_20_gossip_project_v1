module GossipsHelper

  def already_exists?(gossip)
    return Like.where(user_id: current_user.id, gossip_id: gossip.id).length > 0
  end

end