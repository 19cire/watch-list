class ListsController < ApplicationController
  before_action :list_id, only: [:show]
  before_action :params_list, only: [:create]
  def index
    @lists = List.all
  end

  def show
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.new
  end
  def create
    @list = List.create(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
  private
  def list_id
    @list = List.find(params[:id])
  end

  def params_list
    params.require(:list).permit(:name)
  end
end
