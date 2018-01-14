class PagesController < ApplicationController
  def home
      @page_title = "Homepage"
      @skills = Skill.all
  end

  def about
  end

  def contact
      @page_title += 'Contact'
      @facebook = "facebook.com/sahilreddevil4ever"
  end

  def tech_news
      @tweets = SocialTool.twitter_search
  end
end
