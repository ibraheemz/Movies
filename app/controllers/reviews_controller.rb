class ReviewsController < ApplicationController

    before_action :set_movie

    def index
        @reviews = @movie.reviews
    end

    def new
        @review = Review.new
    end

    def create
        @review = @movie.reviews.new(review_params)
        @review.user = current_user
        if @review.save
            redirect_to movie_reviews_path(@movie.slug), notice: "You've add your review successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    
        def review_params
            params.require(:review).permit(:body, :stars)
        end

        def set_movie
            @movie = Movie.find_by!(slug: params[:movie_id])
        end

end
