class CareersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @career = Career.find(params[:id])
    authorize @career
    @professionals = Professional.where(career: @career)
        @tags = {
            "agriculture" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Farm, Organic, Research, Growth, Nature",
            "education" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, School, College, Teacher, Students, Children",
            "arts" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Paintings, Design, Style, Artist, Gallery, Creative, Photography, Nature",
            "engineering" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Software, hardware, Science, Computer, Development, Project, Electricity",
            "health" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Nutrition, Genetic, Lab, Healthcare, Biology,",
            "law" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Criminally, Juridical, Legal, Politics, Courts",
            "science" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Cell, Biology, Phisical, Theory, Electricity",
            "technology" => "Freelance, Executive, Office Worker, Part-time, Entrepreneur, Date, Startup, Robotics, Software, Physic, Electricity"
          }
  end
end
