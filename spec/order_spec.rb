require 'order'

describe Order do

  let(:order) { Order.new('diego', 3.5, 1000, 'BUY') }

  context 'new order is initialized with list of properties' do
    describe '#get_order' do
      it 'returns list of order attributes' do
        order_attributes = {user_id: 'diego', order_quantity: 3.5, price_per_kl: 1000, order_type: 'BUY'}
        expect(order.get_order).to eq(order_attributes)
      end

      it 'returns nil when the order has been removed' do
        order.remove_order
        expect(order.get_order).to eq(nil)
      end
    end

    describe '#remove_order' do
      it 'returns nil' do
        expect(order.remove_order).to eq({})
      end
    end
  end
end
