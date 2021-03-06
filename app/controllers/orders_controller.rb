class OrdersController < ApplicationController
  def create
    # 建立訂單
    order = current_user.orders.new(order_params)
    current_cart.items.each do |item|
      order.order_items << OrderItem.new(product: item.product,
                                         quantity: item.quantity)
    end
    order.save

    # 付錢
    nonce = params[:payment_method_nonce]

    result = gateway.transaction.sale(
      amount: current_cart.total_price,
      payment_method_nonce: nonce
    )

    if result.success?
      # 清空購物車
      session[:cart9527] = nil

      # 訂單改狀態
      order.pay!

      # 走！
      redirect_to root_path, notice: '感謝大爺'
    else
      redirect_to root_path, notice: '發生錯誤'
    end
  end

  private
  def order_params
    params.require(:order).permit(:username, :tel, :address)
  end

  def gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: 'stx9ddgg2bc3ytjn',
      public_key: 'y8v5d938x2fkxbmn',
      private_key: 'a644912fb3a9c696b9bbf22356129350',
    )
  end
end
