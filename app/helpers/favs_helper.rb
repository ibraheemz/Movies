module FavsHelper

    def fave_or_unfave_button(fave, movie)
        if fave
            button_to "Unfave", movie_fav_path(movie, fave), method: :delete, class: "btn btn-secondary" 
        else 
            button_to "Fave", movie_favs_path(movie), class: "btn btn-secondary" 
        end 
    end

end
