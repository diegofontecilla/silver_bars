require 'order'

describe Order do

  let(:order) { Order.new('diego', 3.5, 1000, 'BUY') }

  context 'new order is initialized with list of properties' do
    describe '#get_order' do
      it 'returns list of order attributes' do
        order_attributes = {user_id: 'diego', order_quantity: 3.5, price_per_kl: 1000, order_type: 'BUY'}
        expect(order.get_order).to eq(order_attributes)
      end
    end
  end
  
end
