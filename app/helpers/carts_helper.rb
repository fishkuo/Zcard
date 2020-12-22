module CartsHelper
  def current_cart
    @__cart9527 ||= Cart.from_hash(session[:cart9527])
  end
end
