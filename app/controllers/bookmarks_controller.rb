class BookmarksController < ApplicationController

  before_action :set_bookmark, only: [:destroy]

  def create
    @list = List.find(params[:list_id])

    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render "lists/show"
    end

  end

  def new

  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
