class CommentsController < ApplicationController
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_movie, :set_user

  def index
    @comments = @movie.comments.all
  end

  def show
  end

  def new
    @comment = @movie.comments.new
    render partial: "form"
  end
  
  def create
    @comment = @movie.comments.create(comment_params)

    if @comment.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    render partial: "form"
  end

  def update
    if @comment.update(comment_params)
      redirect_to movie_comments_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    redirect_to movie_comments_path(@movie)
  end

  private
  
  # def set_comment
  #   @comment = Comment.find(params[:id])
  # end

  def set_user
    @user = current_user.id
  end


  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    @user = current_user
    params.require(:comment).permit(:body, :movie_id, :user_id)
  end

end