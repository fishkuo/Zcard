class PagesController < ApplicationController
  def pricing
    @products = Product.order(price: :asc)
  end
end
