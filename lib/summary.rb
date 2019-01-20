
class Summary
  attr_reader :sell_orders_list, :buy_orders_list

  def initialize
    @sell_orders_list = []
    @buy_orders_list = []
  end

  def get_summary_information(order_list)
    create_sell_and_buy_orders_list(order_list)
  end

  private

  def create_sell_and_buy_orders_list(order_list)
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

# summary = Summary.new
# summary.get_summary_information([{:user_id=>"fran", :order_quantity=>4.5,
#   :price_per_kl=>1500, :order_type=>"BUY"}, {:user_id=>"alberto",
#     :order_quantity=>2.5, :price_per_kl=>500, :order_type=>"SELL"},
#     {:user_id=>"al", :order_quantity=>9.5, :price_per_kl=>800,
#       :order_type=>"SELL"}, {:user_id=>"robert", :order_quantity=>11.5,
#       :price_per_kl=>1500, :order_type=>"BUY"}])
# p summary.sell_orders_list
# p summary.buy_orders_list
