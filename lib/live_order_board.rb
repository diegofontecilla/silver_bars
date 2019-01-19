require_relative 'order'

class LiveOrderBoard
  attr_reader :order_list

  def initialize(order = Order)
    @order = order
    @order_list = []
  end

  def register_order(user_id, order_quantity, price_per_kl, order_type)
    new_order = @order.new(user_id, order_quantity, price_per_kl, order_type)
    add_to_order_list(new_order)
  end

  def add_to_order_list(new_order)
    order_list << new_order.get_order
  end

  def remove_order(user_id)
    order_list.each do |order|
      order_list.delete(order) if order[:user_id] == user_id
    end
  end
end



# live_order_board = LiveOrderBoard.new
# live_order_board.register_order('fran', 4.5, 1500, 'BUY')
# live_order_board.register_order('alberto', 2.5, 500, 'BUY')
# live_order_board.register_order('tina', 3.1, 200, 'SELL')
# live_order_board.remove_order('alberto')
# p live_order_board.order_list
