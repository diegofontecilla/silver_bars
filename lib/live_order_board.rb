require_relative 'order'
require_relative 'summary'

class LiveOrderBoard
  attr_reader :order_list, :summary

  def initialize(order = Order, summary = Summary.new )
    @order = order
    @summary = summary
    @order_list = []
  end

  def register_order(user_id, order_quantity, price_per_kl, order_type)
    new_order = @order.new(user_id, order_quantity, price_per_kl, order_type)
    add_to_order_list(new_order)
  end

  def remove_order(user_id)
    order_list.each do |order|
      order_list.delete(order) if order[:user_id] == user_id
    end
  end

  def get_summary_information
    summary.get_summary_information(order_list)
  end

  private

  def add_to_order_list(new_order)
    order_list << new_order.get_order
  end
end



# live_order_board = LiveOrderBoard.new
# live_order_board.register_order('robert', 8.5, 800, 'SELL')
# live_order_board.register_order('fran', 4.5, 1500, 'BUY')
# live_order_board.register_order('alberto', 2.5, 500, 'SELL')
# live_order_board.register_order('al', 3.5, 1500, 'BUY')
# live_order_board.get_summary_information
