module V1
  class SeasonsController < BaseController

    def_param_group :season do
      param :title, String, required: true
    end

    api!
    def index
      @season_with_episode_count = Season.season_with_episode_count
      render json: @season_with_episode_count
    end

    api!
    def show
      @season = Season.find(params[:id])
      render json: @season
    end

    api :POST, "/seasons", "New Season"
    param_group :season
    def create
      @season = Season.new(season_params)
      if @season.save
        render json: @season, status: :created, location: @season
      else
        render json: @season.errors, status: :unprocessable_entity
      end
    end

    api!
    param_group :season
    def update
      @season = Season.find(params[:id])
      if @season.update_attributes(season_params)
        head :no_content
      else
        render json: @season.errors, status: :unprocessable_entity
      end
    end
    #
    # api!
    # param_group :season
    # def season_with_episodes
    #   season = Season.find(params[:id])
    #   episode_count = Season.list_of_episode_count(season.id)
    # end

    api!
    def destroy
      @season = Season.find(params[:id])
      @season.destroy
      head :no_content
    end

    private

    def season_params
      params.require(:season).permit(:title)
    end

  end
end
