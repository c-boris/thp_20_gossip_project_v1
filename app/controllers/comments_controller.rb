class CommentsController < ApplicationController

  def create
    @comment = Comment.create(content: params[:content], user_id: current_user.id, gossip_id: params[:gossip_id], commentable: [Gossip.all, Comment.all].sample.sample)
    flash[:notice] = "Le commentaire a été publié ! "
    redirect_to gossip_path(params[:gossip_id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @path = Gossip.find_by(id: @comment.gossip_id)

    if @comment.update(content: params[:comment][:content])
      flash[:success] = "Le commentaire a été modifié."
      redirect_to @path
    else
      Rails.logger.info(@comment.errors.inspect) 
      render :edit
    end

  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @path = Gossip.find_by(id: @comment.gossip_id)

    if @comment.destroy
      flash[:success] = "Le commentaire a été supprimé."
      redirect_to @path
    else
      Rails.logger.info(@comment.errors.inspect) 
      render :edit
    end
  end

end