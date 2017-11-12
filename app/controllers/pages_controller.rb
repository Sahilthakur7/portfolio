class PagesController < ApplicationController
  def home
      @page_title = "Homepage"
      @skills = Skill.all
  end

  def about
  end

  def contact
  end
end
