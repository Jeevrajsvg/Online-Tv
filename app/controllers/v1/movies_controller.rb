module V1
  class MoviesController < BaseController
    skip_before_action :verify_authenticity_token

    def_param_group :movie do
      param :title, String, required: true
    end

    api!
    def index
      @movies = Movie.order(:title)
      render json: @movies
    end

    api!
    def show
      @movie = Movie.find(params[:id])
      render json: @movie
    end

    api!
    param_group :movie
    def create
      @movie = Movie.new(movie_parmas)
      if @movie.save
        render json: @movie, status: :created, location: @movie
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
    end

    api!
    param_group :movie
    def update
      @movie = Movie.find(params[:id])
      if @movie.update_attributes(movie_parmas)
        head :no_content
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
    end

    api!
    def destroy
      @movie = User.find(params[:id])
      @movie.destroy
      head :no_content
    end

    private

    def movie_parmas
      binding.pry
      params.require(:movie).permit(:title)
    end

  end
end
