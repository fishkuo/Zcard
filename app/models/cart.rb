class Cart
  def initialize(items = [])
    @items = items
  end

  def self.from_hash(hash)
    if hash && hash["items"]
      # 還原
      # items = []
      # hash["items"].each do |item|
      #   items << CartItem.new(item["item_id"], item["quantity"])
      # end
      items = hash["items"].map { |item| CartItem.new(item["item_id"],
                                                      item["quantity"]) }
      Cart.new(items)
    else
      Cart.new
    end
  end

  def serialize
    # items = []
    # @items.each do |item|
    #   items << { "item_id" => item.item_id,
    #              "quantity" => item.quantity }
    # end

    items = @items.map { |item| { "item_id" => item.item_id,
                                   "quantity" => item.quantity } }

    { "items" => items }
  end

  def add_item(item_id, quantity = 1)
    # 判斷
    found_item = @items.find { |item| item.item_id == item_id }

    if found_item
      # 增加數量
      found_item.increment(quantity)
    else
      # 給一個新的 CartItem
      @items << CartItem.new(item_id, quantity)
    end
  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end

  def total_price
    total = @items.sum { |item| item.total_price }

    if Date.today.month == 12 && Date.today.day == 12
      total = total * 0.9
    end

    total
  end
end