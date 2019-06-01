class CommentsController < ApplicationController
  before_action :set_comment, only:[:show, :edit,:update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    #@comment = Comment.new
    @comment = current_user.comments.build
    
  end
  
  def create
    @comment = current_user.comments.build(comment_params)

    if @page.save
      redirect_to comments_path
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  def destroy
    @comment.destory
    redirect_to comments_path
  end

  private
  
  def set_comment
    @comment= Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :movie_id)
  end
end

puts "seeded"
