class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |f|
      if @post.save
        f.html { redirect_to root_url, notice: "Post saved" }
      else
        # get all error messages
        messages = "";
        @post.errors.full_messages.each do |msg|
          messages += " " + msg
        end
        f.html { redirect_to root_url, notice: "Errors in post: #{messages}" }
      end
    end
  end

  # show all posts for a tag
  def tags
    @tags = Tag.all
    @tag = Tag.find_by(name: params[:name])
    @posts = @tag.posts
  end

  private

    # strong parameters
    def post_params
      params.require(:post).permit(:title, :body, :taglist)
    end
end
