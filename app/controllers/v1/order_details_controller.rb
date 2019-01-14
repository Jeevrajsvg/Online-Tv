module V1
  class OrderDetailsController < BaseController

    def_param_group :order_detail do
      param :order_detail, Hash, :required => true do
        param :user_id, Integer, required: true
        param :order_type, String, required: true
        param :order_id, Integer, required: true
        param :price, Float, required: true
        param :quality, String, required: true
      end
    end

    api :GET, "/v1/order_details", "Listing of all Order Details"
    def index
      order_details = OrderDetail.all.order(:created_at)
      render json: {order_details: order_details}
    end

    api :GET, "/v1/fetch_user_order_details/user_id", "Listing of User Order Details for specific User"
    def fetch_user_order_details
      order_details = OrderDetail.user_detail_orders(params["user_id"])
      render json: {user_order_details: order_details}
    end

    api :GET, "/v1/user_order_detail_remaining_time/user_id", "User has remaining time to watch the content"
    def user_order_detail_remaining_time
      order_details = OrderDetail.remaining_time(params["user_id"])
      render json: {remaining_time: order_details}
    end

    api :POST, "/v1/order_details","Adding user to perform a purchase of a content in OrderDetail passing with {used_id, order_type, order_id, price, quality}"
    param_group :order_detail
    def create
      order_detail = OrderDetail.user_exist_for_order_detail(order_detail_params)
      render json: {order_detail: order_detail}
    end

    private
    def order_detail_params
      params.require(:order_detail).permit(:user_id,:order_type,:order_id,:price,:quality)
    end

  end
end
