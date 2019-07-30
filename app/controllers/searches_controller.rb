class SearchesController < ApplicationController
   skip_before_action :authenticate_user!
  def index
    if params[:search_type] == "career"
      @results = Career.search_by_title(params[:q])
    elsif params[:search_type] == "category"
      @results = Category.search_by_title(params[:q])
    elsif params[:search_type] == "user"
      @results = User.search_by_name_or_specialty(params[:q]).where(user_type: 1)
     else
       @results = PgSearch.multisearch(params[:q])
     end
  end
end
