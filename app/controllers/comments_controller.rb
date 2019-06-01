class CommentsController < ApplicationController
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_movie

  def index
    @comments = @movie.comments.all
  end

  def show
  end

  def new
    @comment = @movie.comments.new
    
  end
  
  def create
    @comment = @movie.comments.new(comment_params)

    if @comment.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    @comment = @movie.comments.new
    render partial: "form"
  end

  def update
    @comment = @movie.comments.new
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

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :movie_id)
  end

end