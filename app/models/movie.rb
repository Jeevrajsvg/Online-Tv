class Movie < ApplicationRecord
  has_many :order_details, as: :order
  has_many :users, through: :order_details

  validates :title,:plot, presence: true

  def self.user_movies(user_id)
    user_exists = User.exists?(user_id)
    (user_id.present? && user_exists) ? User.find_by_id(user_id).orders_movie.order(:created_at) : "No records found"
  end
end
