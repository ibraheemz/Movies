class MoviesController < ApplicationController
    before_action :require_signin, except: [:index, :show]
    before_action :require_admin, except: [:index, :show]
    before_action :set_movie, only: [:show, :edit, :update, :destroy]

    def index
        case params[:filter]
        when "upcoming"
            @movies = Movie.upcoming
        when "released"
            @movies = Movie.released
        else
            @movies = Movie.all
        end
    end

    def show
        @favers = @movie.favers
        @fave = current_user.favs.find_by(movie_id: @movie.id)
        @genres = @movie.genres
    end

    def edit
    end

    def update
        if @movie.update(movie_params)
            redirect_to @movie, notice: "movie successfully updated!"
        else
            render :edit, status: :unprocessable_entity
        end
        # instead of using movie_path helper, give redirect_to the model and rails will know you want to generate a path for the movie show action
        # redirect so that the update method won't try to find update view
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to @movie, notice: "movie successfully added!"
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @movie.destroy
        redirect_to movies_url, alert: "Movie successfully deleted!"
    end

    
    private
        def set_movie
            @movie = Movie.find_by!(slug: params[:id])
        end

        def movie_params
            params.require(:movie).
                permit(:title, :description, :released_on, :rating, :total_gross, :poster_file_name, genre_ids: [])
        end
end
