class FavsController < ApplicationController
    before_action :require_signin

    def create
        movie = Movie.find_by(slug: params[:movie_id])
        movie.favs.create!(user: current_user)
        redirect_to movie_path(movie)
    end

    def destroy
        fave = current_user.favs.find(params[:id])
        fave.destroy

        @movie = Movie.find_by!(slug: params[:movie_id])
        redirect_to movie_path(@movie)
    end

end
