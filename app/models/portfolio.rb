class Portfolio < ApplicationRecord
    validates_presence_of :title, :main_image
    after_initialize :set_defaults

    def self.react
        where(subtitle: 'ReactJS')
    end

    def self.ror
        where(subtitle: 'Ruby on Rails')
    end

    def set_defaults
        self.main_image ||="http://placehold.it/600x400"
        self.thumb_image ||="http://placehold.it/300x200"
    end



end
