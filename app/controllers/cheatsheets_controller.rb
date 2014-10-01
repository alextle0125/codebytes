class CheatsheetsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @cheatsheets = Cheatsheet.all
  end

  def show
    @user = User.find(params[:user_id])
    @cheatsheets = @user.cheatsheets.find(params[:id])
    @snippets = @cheatsheets.snippets.includes(:tags).where("tags.title" => params[:filter])
  end

  def filter
    @search_by_title = Snippet.search(params[:q])
    @user = User.find(params[:user_id])
    @cheatsheets = @user.cheatsheets.find(params[:id])
    @snippets = @cheatsheets.snippets.includes(:tags).where("tags.title" => params[:filter])
    @tags = []
    @cheatsheets.snippets.each do |snippet| 
      snippet.tags.each do |tag| 
        @tags << tag.title
      end
    end
    @tags.uniq!
  end

  def create
    @user = User.find(params[:user_id])
    @cheatsheet = Cheatsheet.create(cheatsheet_params)
    redirect_to user_cheatsheet_path
  end

  def new
    @cheatsheet = Cheatsheet.new
  end

  def edit
    @cheatsheet = Cheatsheet.find(params[:id])
    redirect_to user_cheatsheet_path
  end

  def update
    # @cheatsheet = Cheatsheet.find(params[:id])
    # @cheatsheet.update(cheatsheet_params)
    # redirect_to user_cheatsheet_path
  end

  def add_snippet
    user = User.find(params[:user_id])
    @snippet = Snippet.find(params[:id])
    user.cheatsheets.first.snippets << @snippet
    @snippet.increment!(:snip_count)
    redirect_to root_path
  end

  def remove_snippet
    user = User.find(params[:user_id])
    @snippet = Snippet.find(params[:id])
    user.cheatsheets.first.cheatsheet_snippets.find_by_snippet_id(@snippet.id).destroy
    @snippet.decrement!(:snip_count)
    redirect_to user_path(user.id)
  end

  def destroy
    cheatsheet = Cheatsheet.find(params[:id])
    cheatsheet.destroy
    redirect_to user_cheatsheets_path
  end

  private
    def cheatsheet_params
      params.require(:cheatsheet).permit(:name)
    end
end
