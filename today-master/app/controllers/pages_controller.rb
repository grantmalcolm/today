class PagesController < ApplicationController
  def home
    # show everyone's posts on the home page
    @posts = Post.all
    # show all tags
    @tags = Tag.all
    # for new posts
    if user_signed_in?
      @post = current_user.posts.build
    end
  end

  def userhome
    # show all tags
    @tags = Tag.all
    # username supplied in params
    the_user = User.find_by_username(params[:id])
    if (the_user)
      # point to that user's name and posts
      @username = params[:id]
      @posts = the_user.posts
      # to post from userhome page
      if user_signed_in? && @username == current_user.username
        @post = current_user.posts.build
      end
    else
      redirect_to root_path, :notice => "User not found."
    end
  end

  def members
    # all the signed-up users
    @users = User.all
    @tags = Tag.all
  end

  def help
  end

  def about
  end
end
