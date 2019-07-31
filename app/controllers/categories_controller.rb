class CategoriesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_category, only: [:show]

  def index
    @categories = policy_scope(Category).all
  end

  def show
    @careers = Career.where(category:@category)
    @tags = {
            "agriculture" => "Freelance, Executive, Office Workder, Part-time, Entepreneur, Farm, Organic, Research, Growth, Nature",
            "education" => "Freelance, Executive, Office Workder, Part-time, Entepreneur, School, College, Teacher, Students, Children",
            "arts" => "Freelance, Executive, Office Workder, Part-time, Entepreneur, Paitings, Design, Style, Artist, Gallery, Creative, Photography, Nature",
            "engineering" => "Freelance, Executive, Office Workder, Part-time, Entepreneur, Software, hardware, Science, Computer, Development, Project, Electricity",
            "health" => "Freelance, Executive, Office Workder, Part-time, Entepreneur, Nutrition, Genetic, Lab, Healthcare, Biology,",
            "law" => "Freelance, Executive, Office Workder, Part-time, Entepreneur, Criminally, Juridical, Legal, Politics, Courts",
            "science" => "Freelance, Executive, Office Workder, Part-time, Entepreneur, Cell, Biology, Phisical, Theory, Electricity",
            "technology" => "Freelance, Executive, Office Workder, Part-time, Entepreneur, Date, Startup, Robotics, Software, Physic, Electricity"
          }
  end


  private

  def set_category
    @category = Category.find(params[:id])
    authorize @category
  end
end
