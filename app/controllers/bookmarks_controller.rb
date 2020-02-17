class BookmarksController < ApplicationController
  def index
    @bookmarks = @current_user.bookmarks

    render({ :template => "bookmarks/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @bookmark = Bookmark.where({:id => the_id }).at(0)

    render({ :template => "bookmarks/show.html.erb" })
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user_id = session[:user_id]
    @bookmark.movie_id = params.fetch("movie_id_from_query")

    if @bookmark.valid?
      @bookmark.save
      redirect_to("/bookmarks", { :notice => "Bookmark created successfully." })
    else
      redirect_to("/bookmarks", { :notice => "Bookmark failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @bookmark = Bookmark.where({ :id => the_id }).at(0)

    @bookmark.user_id = params.fetch("user_id_from_query")
    @bookmark.movie_id = params.fetch("movie_id_from_query")

    if @bookmark.valid?
      @bookmark.save
      redirect_to("/bookmarks/#{@bookmark.id}", { :notice => "Bookmark updated successfully."} )
    else
      redirect_to("/bookmarks/#{@bookmark.id}", { :alert => "Bookmark failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @bookmark = Bookmark.where({ :id => the_id }).at(0)

    @bookmark.destroy

    redirect_to("/bookmarks", { :notice => "Bookmark deleted successfully."} )
  end
end
