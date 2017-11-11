module CurrentUserConcern
    def current_user
        super || guest_user 
    end

    def guest_user
        OpenStruct.new(name: "Anonymous User",
                       first_name: "Anonymous",
                       last_name: "Guest",
                       email: "tottlay@anonymos.com"
                      )
    end
end
