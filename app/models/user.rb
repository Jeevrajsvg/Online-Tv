class User < ApplicationRecord
  has_many :order_details
  has_many :orders_movie, through: :order_details, source: :order, source_type: 'Movie'
  has_many :orders_season, through: :order_details, source: :order, source_type: 'Season'

  scope :current_user, -> (user_id) {find_by_id user_id}
  validates :email, presence: true
end
