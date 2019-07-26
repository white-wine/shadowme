class SearchesController < ApplicationController
  def index
    if params[:search_type] == "career"
      @careers = Career.search_by_title(params[:q])
    elsif params[:search_type] == "category"
      @categories = Category.search_by_title(params[:q])
    elsif params[:search_type] == "user"
      @users = User.search_by_name_or_specialty(params[:q])
     else
       @results = PgSearch.multisearch(params[:q])
     end
  end
end
