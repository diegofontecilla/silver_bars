
class Summary
  attr_reader :sell_orders_list, :buy_orders_list

  def initialize
    @sell_orders_list = []
    @buy_orders_list = []
    @sum = 0
  end

  def get_summary_information(order_list)
    configurate_sell_and_buy_orders_list(order_list)
    get_orders_summary(sell_orders_list)
    print_summary(sell_orders_list)
    get_orders_summary(buy_orders_list)
    print_summary(buy_orders_list)
  end

  private

  def get_orders_summary(orders_list)
    @sell_price_per_kg_list = orders_list.map { |order| order[:price_per_kg] }

    orders_list.each do |order|
      if @sell_price_per_kg_list.count(order[:price_per_kg]) > 1
        @sum += order[:order_quantity]
      end
    end
  end

def print_summary(orders_list)
  order_type = orders_list[0][:order_type]
  puts "#{order_type} orders:"

  orders_list.each do |order|
    if @sell_price_per_kg_list.count(order[:price_per_kg]) > 1
      puts "- #{@sum} kg for £#{order[:price_per_kg]}"
    else
      puts "- #{order[:order_quantity]} kg for £#{order[:price_per_kg]}"
    end
  end
  @sum = 0
end

  def configurate_sell_and_buy_orders_list(order_list)
    order_list.each do |order|
      order[:order_type] == 'SELL' ? add_to_sell_orders_list(order) : add_to_buy_orders_list(order)
    end
  end

  def add_to_sell_orders_list(order)
    sell_orders_list << order
  end

  def add_to_buy_orders_list(order)
    buy_orders_list << order
  end
end
