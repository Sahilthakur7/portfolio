class Portfolio < ApplicationRecord

    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader
    has_many :technologies
    accepts_nested_attributes_for :technologies, allow_destroy: true,
       reject_if: lambda { |attrs| attrs['name'].blank?}

    validates_presence_of :title 

    def self.react
        where(subtitle: 'ReactJS')
    end

    def self.ror
        where(subtitle: 'Ruby on Rails')
    end


    def self.by_position
        order("position ASC")
    end



end
