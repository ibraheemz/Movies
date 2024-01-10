module MoviesHelper

    def year(date)
        date.strftime("%Y %B %d")
    end

    def poster_image(movie)
        if movie.poster_image.attached?
            image_tag movie.poster_image
        else
            image_tag "placeholder"
        end
    end

end
