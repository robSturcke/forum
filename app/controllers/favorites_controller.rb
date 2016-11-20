class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "Saved as favorite!"
    else
      flash[:alert] = "Favorite failed to save."
    end
    redirect_to [post.topic, post]
  end

  def destroy
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.find(params[:id])

     if favorite.destroy
       flash[:notice] = "Post unfavorited."
     else
       flash[:alert] = "Unfavoriting failed."
     end
       redirect_to [post.topic, post]
   end
end
