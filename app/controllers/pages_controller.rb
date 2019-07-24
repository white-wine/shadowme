class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    allCategories = Category.all
    topFour = ['Engineering', 'Education', 'Arts', 'Health']
    @categories = allCategories.select{ |item| topFour.include?(item.title)  }
  end
  def index
  end
end
