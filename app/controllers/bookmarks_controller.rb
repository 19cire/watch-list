class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  def new
    @bookmark = Bookmark.new


  end
  def create
    @bookmark = Bookmark.create(params_bookmark)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else

      render :new
    end
  end

  def destroy
    Bookmark.find(params[:id]).destroy
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
