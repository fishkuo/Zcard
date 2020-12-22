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
      merchant_id: 'stx9ddgg2bc3ytjn',
      public_key: 'y8v5d938x2fkxbmn',
      private_key: 'a644912fb3a9c696b9bbf22356129350',
    )
  end
end
