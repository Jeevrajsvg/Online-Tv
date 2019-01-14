Rails.application.routes.draw do
  apipie
  scope :module => :v1, :path => '/api/v1' do
    resources :movies,only: [:index,:create]
    resources :seasons, only: [:index,:create] do
      get :season_with_episode_count,on: :collection
    end
    resources :order_details, only: [:index, :create]
    get "fetch_user_movies/:user_id",  to: "movies#fetch_user_movies"
    get "fetch_user_seasons/:user_id", to: "seasons#fetch_user_seasons"
    get "fetch_user_order_details/:user_id", to: "order_details#fetch_user_order_details"
    get "user_order_detail_remaining_time/:user_id", to: "order_details#user_order_detail_remaining_time"
  end
end
