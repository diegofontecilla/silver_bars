require_relative 'order'
require_relative 'summary'

class LiveOrderBoard
  attr_reader :order_list, :summary

  def initialize(order_class = Order, summary_class = Summary )
    @order_class = order_class
    @summary_class = summary_class
    @order_list = []
  end

  def register_order(user_id, order_quantity, price_per_kg, order_type)
    new_order = @order_class.new(user_id, order_quantity, price_per_kg, order_type)
    add_to_order_list(new_order)
  end

  def remove_order(user_id)
    order_list.each do |order|
      order_list.delete(order) if order.user_id == user_id
    end
  end

  def get_summary_information
    summary = @summary_class.new(@order_list)
    sales = summary.merge(summary.sales)
    purchases = summary.merge(summary.purchases)
    print(sales)
    print(purchases)
  end

  def print(info)
    puts "Sales:" if info[0][:order_type] == 'SELL'
    puts "Purchases:" if info[0][:order_type] == 'BUY'

    info.each do |i|
      puts "- #{i[:order_quantity]} kg for £#{i[:price_per_kg]}"
    end
  end

  private

  def add_to_order_list(new_order)
    order_list << new_order
  end
end

live_order_board = LiveOrderBoard.new
live_order_board.register_order('fran', 4.0, 1500, 'BUY')
live_order_board.register_order('alberto', 6.0, 400, 'BUY')
live_order_board.register_order('alberto', 6.0, 900, 'BUY')
live_order_board.register_order('erto', 6.0, 900, 'BUY')
live_order_board.register_order('alberto', 6.0, 1500, 'SELL')
live_order_board.register_order('alberto', 6.0, 500, 'SELL')
live_order_board.register_order('alberto', 5.0, 500, 'SELL')
live_order_board.register_order('al', 7.0, 800, 'SELL')
live_order_board.get_summary_information
