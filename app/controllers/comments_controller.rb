class CommentsController < ApplicationController
before_filter :load_commentable

def index
  @comments = @commentable.comments
end

def new
  @comment = @commentable.comments.new
end

def create
  @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "comment added!"
      redirect_to @comment.commentable
    else
      render 'new'
    end
end

def show
  @comment = @commentable.comments.find(params[:id])
  @link = Link.find(@comment.commentable_id)
end

def edit
  @link = Link.find(params[:link_id])
  @comment = @commentable.comments.find(params[:id])
end

def update
  @comment = @commentable.comments.find(params[:id])
  @link = Link.find(@comment.commentable_id)
  if @comment.update(comment_params)
      flash[:notice] = "Comment updated"
      redirect_to link_path(@link)
    else
      flash[:alert] = "error, try again."
      render 'edit'
    end
end

def destroy
  @comment = @commentable.comments.find(params[:id])
  @comment.destroy
  flash[:notice]= "The comment has been deleted."
  redirect_to link_path(@link)
end

private
  def comment_params
    params.require(:comment).permit(:text, :commentable_type, :commentable_id)
  end

  def load_commentable
    resource = request.path.split('/')[1]
    id = request.path.split('/')[2] || params[:comment][:commentable_id]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end

