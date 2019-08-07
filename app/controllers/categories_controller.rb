class CategoriesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_category, only: [:show]

  def index
    @categories = policy_scope(Category).all
  end

  def show
    @careers = Career.where(category:@category)
    @tags = {
            "agriculture" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Farm, Organic, Research, Growth, Nature",
            "education" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, School, College, Teacher, Students, Children",
            "arts" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Paintings, Design, Style, Artist, Gallery, Creative, Photography, Nature",
            "engineering" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Software, hardware, Science, Computer, Development, Project, Electricity",
            "health" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Nutrition, Genetic, Lab, Healthcare, Biology,",
            "law" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Criminally, Juridical, Legal, Politics, Courts",
            "science" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Cell, Biology, Phisical, Theory, Electricity",
            "technology" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Date, Startup, Robotics, Software, Physic, Electricity",
            "government and public administration" => "Executive, Office Worker, Part-time, Entrepreneur, Criminally, Juridical, Legal, Politics, Courts",
            "human services" => "Executive, Office Worker, Part-time, Entrepreneur, Juridical, Legal"
          }
  end


  private

  def set_category
    @category = Category.find(params[:id])
    authorize @category
  end
end
