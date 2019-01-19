
class Order

  def initialize(user_id, order_quantity, price_per_kl, order_type)
    @current_order = {
      user_id: user_id,
      order_quantity: order_quantity,
      price_per_kl: price_per_kl,
      order_type: order_type
    }
  end

  def get_order
    return nil if @current_order == {}
    @current_order
  end

  def remove_order
    @current_order = {}
  end
end
