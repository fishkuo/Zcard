class CartsController < ApplicationController
  def add_item
    # 真．加購物車
    product = Product.find(params[:id])

    current_cart.add_item(product.id)
    session[:cart9527] = current_cart.serialize

    redirect_to pricing_path, notice: '已加入購物車'
  end

  def show
  end

  def destroy
    session[:cart9527] = nil
    redirect_to pricing_path, notice: '購物車已清除'
  end

  def checkout
    @order = Order.new
    @token = gateway.client_token.generate
  end

  private
  def gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV['braintree_merchant_id'],
      public_key: ENV['braintree_public_key'],
      private_key: ENV['braintree_private_key'],
    )
  end
end
