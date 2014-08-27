class LinksController < ApplicationController

  def index
    @links = Link.calc_rank
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Link added!"
      redirect_to link_path(@link)
    else
      render 'new'
    end
  end

  def show
    @link = Link.find(params[:id])
    @comment = Comment.new(commentable_type: "Link", commentable_id: @link.id)
  end

  def edit
     @link = Link.find(params[:id])
   end

  def update
    @link = Link.find(params[:id])
    if link.update(link_params)
      flash[:notice] = "Link updated"
      redirect_to link_path(@link)
    else
      flash[:alert] = "error, try again."
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "The link has been deleted."
    redirect_to links_path
  end

  def upvote
    @link = Link.find(params[:id])
    Link.increment_counter(:votes, params[:id])
    flash[:notice] = "#{@link.description} was successfully upvoted!"
    redirect_to links_path
  end

private
  def link_params
    params.require(:link).permit(:url, :description)
  end

end
