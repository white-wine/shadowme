class CareersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @career = Career.find(params[:id])
    authorize @career
    @professionals = Professional.where(career: @career)
        @tags = {
            "agriculture" => "Freelance, Executive, Office Worker, Part-time, Entepreneur, Farm, Organic, Research, Growth, Nature",
            "education" => "Freelance, Executive, Office Worker, Part-time, Entepreneur, School, College, Teacher, Students, Children",
            "arts" => "Freelance, Executive, Office Worker, Part-time, Entepreneur, Paintings, Design, Style, Artist, Gallery, Creative, Photography, Nature",
            "engineering" => "Freelance, Executive, Office Worker, Part-time, Entepreneur, Software, hardware, Science, Computer, Development, Project, Electricity",
            "health" => "Freelance, Executive, Office Worker, Part-time, Entepreneur, Nutrition, Genetic, Lab, Healthcare, Biology,",
            "law" => "Freelance, Executive, Office Worker, Part-time, Entepreneur, Criminally, Juridical, Legal, Politics, Courts",
            "science" => "Freelance, Executive, Office Worker, Part-time, Entepreneur, Cell, Biology, Phisical, Theory, Electricity",
            "technology" => "Freelance, Executive, Office Worker, Part-time, Entepreneur, Date, Startup, Robotics, Software, Physic, Electricity"
          }
  end
end
