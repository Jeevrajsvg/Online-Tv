module V1
  class MoviesController < BaseController

    def_param_group :movie do
      param :movie, Hash, :required => true do
        param :title, String, required: true
        param :plot, String, required: true
      end
    end

    api :GET, "/v1/movies", "Listing of all Movies"
    def index
      movies = Movie.order(:created_at)
      render json: {movies: movies}
    end

    api :GET, "/v1/fetch_user_movies/user_id", "Listing of specific user movies with passing User Id (Enhancement method)"
    def fetch_user_movies
     user_movies = Movie.user_movies(params["user_id"])
     render json: user_movies
    end

    api :POST, "/v1/movies", "Creating new Movie"
    param_group :movie
    def create
      movie = Movie.new(movie_parmas)
      if movie.save
        render json: {movie: movie}
      else
        render json: movie.errors, status: :unprocessable_entity
      end
    end

    private
    def movie_parmas
      params.require(:movie).permit(:title,:plot)
    end
  end
end
