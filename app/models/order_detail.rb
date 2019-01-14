class OrderDetail < ApplicationRecord
  include UserOrderLibrary

  belongs_to :user
  belongs_to :order, polymorphic: true

  def self.user_detail_orders(user_id)
    User.current_user(user_id).order_details
  end

  def self.remaining_time(used_id)
    user = User.current_user(used_id)
    UserOrderLibrary.fetch_user_remaining_time(user)
  end

  def self.user_exist_for_order_detail(params)
    user = User.current_user(params["user_id"])
    UserOrderLibrary.user_exist_for_order_library(user, params)
  end
end
