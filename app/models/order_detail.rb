class OrderDetail < ApplicationRecord
  belongs_to :user
  belongs_to :order, polymorphic: true

  def self.user_detail_orders(user_id)
    User.current_user(user_id).order_details
  end

  def self.remaining_time(used_id)
    user = User.current_user(used_id)
    season_purchase = user.order_details
    two_days = 2
    order_date = season_purchase.first.created_at.to_datetime
    order_date_parsed = DateTime.parse(order_date.to_s,'%m/%d/%Y %H:%M %P')
    current_date_parsed = DateTime.now
    expire_date = order_date_parsed + two_days
    remaining_days = (order_date_parsed - current_date_parsed)
    (expire_date == current_date_parsed) ? User.current_user(used_id).order_details.delete_all : "#{user.email} has remaining #{remaining_days.to_i} day to watch the content"
  end

  def self.user_exist_for_order_detail(params)
    user = User.current_user(params["user_id"])
    oder_detail_purchase = OrderDetail.return_order_detail_type(user,params)
    !oder_detail_purchase.exists? ? create_object(params) : "#{oder_detail_purchase.first.title} is already purchased"
  end

  def self.return_order_detail_type(user,params)
    params["order_type"] == "Season" ? user.orders_season.where(id: params["order_id"]) : user.orders_movie.where(id: params["order_id"])
  end

  def self.create_object(params)
    OrderDetail.create(user_id: params["user_id"],order_type: params["order_type"],order_id: params["order_id"],price: params["price"],quality: params["quality"])
  end
end
