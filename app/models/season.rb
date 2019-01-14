class Season < ApplicationRecord
  has_many :episodes
  has_many :order_details, as: :order
  has_many :users, through: :order_details

  validates :title,:plot, presence: true

  def self.season_with_episode_count
    season_with_episodes = []
    season_objects = Season.includes(:episodes).order(:created_at)
    season_objects.each do |season|
      season_with_episodes << {title: season.title, episode_count: season.episodes.count}
    end
    return season_with_episodes
  end

  def self.user_seasons(user_id)
    user_exists = User.exists?(user_id)
    (user_id.present? && user_exists) ? User.find_by_id(user_id).orders_season.order(:created_at) : "No records found"
  end

end
