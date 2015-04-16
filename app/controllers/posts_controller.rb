
class PostsController < ApplicationController
  def index
    @user = current_user

    @posts = @user.posts.order("created_at DESC")
    respond_to do |format|
      format.html
    end
  end

  def show
    @post=Post.find(params[:id])
  end

  def create

   # @post = current_user.posts.creat(post_params)
    @post = current_user.posts.create(:message => params[:message], :user_id=>params[:user_id])
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
        format.js
      else
        flash[:notice] = "Message failed to save."
        format.html { redirect_to posts_path }
      end
    end
  end




  def destroy
    @post.destroy
    @foo=@post.user_id
    flash[:success] = "Post deleted"
    redirect_to posts_path(foo_param: @foo), notice: 'Todo item was successfully destroyed.'
  end



  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end


