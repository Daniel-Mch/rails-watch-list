class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])

    @bookmark = Bookmark.new
  end

  def create

    # send with address
    @list = List.find(params[:list_id])
    # send with form
    @bookmark = Bookmark.new(bookmark_params)

    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end

  end

  def destroy

  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
