module V1
  class SeasonsController < BaseController

    def_param_group :season do
        param :season, Hash, :required => true do
          param :title, String, required: true
          param :plot, String, required: true
        end
    end

    api :GET, "/v1/seasons", "Listing of all Seasons"
    def index
      seasons = Season.order(:created_at)
      render json: {seasons: seasons}
    end


    api :GET, "/v1/seasons/season_with_episode_count", "Listing of Episodes count per seasons"
    def season_with_episode_count
      season_with_episode_count = Season.season_with_episode_count
      render json: {season_with_episode_count: season_with_episode_count}
    end

    api :GET, "/v1/fetch_user_seasons/user_id", "Listing of specific user seasons with passing User Id (Enhancement method)"
    def fetch_user_seasons
      user_movies = Season.user_seasons(params["user_id"])
      render json: user_movies
    end

    api :POST, "/v1/seasons", "Creating New Season"
    param_group :season
    def create
      season = Season.new(season_params)
      if season.save
        render json: {season: season}
      else
        render json: season.errors, status: :unprocessable_entity
      end
    end

    private
    def season_params
      params.require(:season).permit(:title,:plot)
    end

  end
end
