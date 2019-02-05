
class Summary

  def initialize(orders)
    @orders = orders
  end

  def sales
    sales = @orders.select { |o| o.order_type == 'SELL' }
  end

  def purchases
    purchases = @orders.select { |o| o.order_type == 'BUY' }
  end

  def merge(orders)
    prices = orders.map { |o| o.price_per_kg }.uniq

    prices.map do |p|
      orders_for_price = orders.select { |o| o.price_per_kg == p }
      total_qty_for_price = orders_for_price.sum { |o| o.order_quantity }
      { price_per_kg: p, order_quantity: total_qty_for_price, order_type: orders.first.order_type }
    end
  end
end
