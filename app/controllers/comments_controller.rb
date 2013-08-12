class CommentsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "password", only: :destroy

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    ## Mass assignment is disabled. needto explicitly permit (ref: https://github.com/rails/strong_parameters )
    if @comment.update_attributes(comment_params)
      redirect_to action: :show, id: @comment.id
    else
      render 'edit'
    end
  end

  def show 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
