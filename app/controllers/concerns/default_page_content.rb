module DefaultPageContent
    extend ActiveSupport::Concern
    included do
        before_action :set_page_defaults
    end

  def set_page_defaults
      @page_title = "Sahil Thakur |"
      @seo_keywords = "Sahil Thakur portfolio Ruby Rails Developer ReactJS"
  end

end
