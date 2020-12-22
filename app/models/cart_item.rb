class CartItem
  attr_reader :item_id, :quantity

  def initialize(item_id, quantity = 1)
    @item_id = item_id
    @quantity = quantity
  end

  def increment(n = 1)
    @quantity = @quantity + n
  end

  def product
    # 回傳指定商品
    Product.find(@item_id)
  end

  def total_price
    @quantity * product.price
  end
end
