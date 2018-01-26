class PagesController < ApplicationController
  def home
      @page_title = "Homepage"
      @skills = Skill.all
  end

  def about
      @skills = Skill.all
  end

  def contact
      @page_title += 'Contact'
      @facebook = "facebook.com/sahilreddevil4ever"
      @github = 'github.com/sahilthakur7'
  end

  def tech_news
      @tweets = SocialTool.twitter_search
  end
end
