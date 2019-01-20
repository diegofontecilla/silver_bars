require 'summary'

describe Summary do

  let(:summary) { Summary.new }

  order_data = [
    {:user_id=>"fran", :order_quantity=>4.5, :price_per_kl=>1500,
    :order_type=>"BUY"}, {:user_id=>"alberto", :order_quantity=>2.5,
    :price_per_kl=>500, :order_type=>"SELL"}, {:user_id=>"al",
    :order_quantity=>9.5, :price_per_kl=>800, :order_type=>"SELL"},
    {:user_id=>"robert", :order_quantity=>11.5, :price_per_kl=>1500,
    :order_type=>"BUY"}]

  buy_orders = [
    {:user_id=>"fran", :order_quantity=>4.5, :price_per_kl=>1500,
    :order_type=>"BUY"}, {:user_id=>"robert", :order_quantity=>11.5,
    :price_per_kl=>1500, :order_type=>"BUY"}]

  sell_orders = [
    {:user_id=>"alberto", :order_quantity=>2.5, :price_per_kl=>500,
    :order_type=>"SELL"}, {:user_id=>"al", :order_quantity=>9.5,
    :price_per_kl=>800, :order_type=>"SELL"}]

  describe '#get_summary_information' do
    it 'adds BUY orders into buy_orders_list' do
      summary.get_summary_information(order_data)
      expect(summary.buy_orders_list).to eq(buy_orders)
    end

    it 'adds SELL orders into sell_orders_list' do
      summary.get_summary_information(order_data)
      expect(summary.sell_orders_list).to eq(sell_orders)
    end
  end

end
