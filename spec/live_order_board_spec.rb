require 'live_order_board'

describe do LiveOrderBoard

  let(:new_order) { double(:new_order)}
  let(:fake_order) { double(:order, :new => new_order) }
  let(:live_order_board) { LiveOrderBoard.new(fake_order) }

  describe '#register_order' do
    it 'call #new in fake_order' do
      allow(new_order).to receive(:get_order)
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      expect(fake_order).to have_received(:new).with('fran', 4.5, 1500, 'BUY')
    end

    it 'call #add_to_order_list on live_order_board' do
      allow(live_order_board).to receive(:add_to_order_list)
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      expect(live_order_board).to have_received(:add_to_order_list)
    end
  end

  describe '#add_to_order_list' do
    it 'add a new order on order list' do
      order_data = {:user_id=>"fran", :order_quantity=>4.5,
                    :price_per_kl=>1500, :order_type=>"BUY"}
      allow(new_order).to receive(:get_order).and_return(order_data)
      live_order_board.add_to_order_list(new_order)
      expect(live_order_board.order_list).to eq([order_data])
    end
  end
end
