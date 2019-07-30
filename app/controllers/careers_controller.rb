class CareersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @career = Career.find(params[:id])
    @professionals = Professional.where(career: @career)
    @agriculture_tags = %w(Freelance, Executive, Office Workder, Part-time, Entepreneur, farm, organic, research, growth, nature)
    @education_tags = %w(Freelance, Executive, Office Workder, Part-time, Entepreneur, school, college, teacher, students, children)
    @art_tags = %w(Freelance, Executive, Office Workder, Part-time, Entepreneur, paitings, design, style, artist, gallery, creative, photography, nature)
    @engineer_tags = %w(Freelance, Executive, Office Workder, Part-time, Entepreneur, software, hardware, science, computer, development, project, electricity)
    @health_tags = %w(Freelance, Executive, Office Workder, Part-time, Entepreneur, nutrition, healthcare, biology,)
    @law_tags = %w(Freelance, Executive, Office Workder, Part-time, Entepreneur,)
    @science_tags = %w(Freelance, Executive, Office Workder, Part-time, Entepreneur,)
    @technology_tags = %w(Freelance, Executive, Office Workder, Part-time, Entepreneur,)
  end

end
