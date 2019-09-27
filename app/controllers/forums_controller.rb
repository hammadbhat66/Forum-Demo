class ForumsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_forum, only: [:destroy,:show,:edit,:update]
  def index
    @forums = Forum.all
    @featured = Forum::featured_list
  end
  def show
    Forum.updateit(params[:id])
    @comment = @forum.comments.build
    @comments = Comment::com_list(params[:id])
  end
  def new
  	@forum = current_user.forums.build
  end

  def create
  	@forum = current_user.forums.build(forum_params)
    if @forum.save!
      redirect_to forums_path
    else
      redirect_back(fallback_location: root_path)
    end
  end
  def edit
  end
  def update
    if @forum.update!(forum_params)
      redirect_to forums_path
    else
      render "edit"
    end
  end
  def destroy
    if @forum.destroy!
      redirect_to forums_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  protected
  def forum_params
    params.require(:forum).permit(:title,:body,:avatar)
  end
  def find_forum
    @forum = Forum.find(params[:id])
  end
end
