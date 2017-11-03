class Portfolio < ApplicationRecord
    includes Placeholder
    has_many :technologies
    accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank?}

    validates_presence_of :title, :main_image
    after_initialize :set_defaults

    def self.react
        where(subtitle: 'ReactJS')
    end

    def self.ror
        where(subtitle: 'Ruby on Rails')
    end

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600',width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '300',width: '200')
    end



end
