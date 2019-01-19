require 'live_order_board'

describe do LiveOrderBoard

  order_data = {:user_id=>"fran", :order_quantity=>4.5,
                :price_per_kl=>1500, :order_type=>"BUY"}

  let(:new_order) { double(:new_order, :get_order => order_data)}
  let(:fake_order) { double(:order, :new => new_order) }
  let(:live_order_board) { LiveOrderBoard.new(fake_order) }

  describe '#register_order' do
    it 'call #new on fake_order' do
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      expect(fake_order).to have_received(:new)
    end

    it 'call #add_to_order_list on live_order_board' do
      allow(live_order_board).to receive(:add_to_order_list)
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      expect(live_order_board).to have_received(:add_to_order_list)
    end
  end

  describe '#add_to_order_list' do
    it 'add a new order on order list' do
      live_order_board.add_to_order_list(new_order)
      expect(live_order_board.order_list).to eq([order_data])
    end
  end

  describe '#remove_order' do
    it 'remove order from list when its user_id is equal to the given user_id' do
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      live_order_board.remove_order('fran')
      expect(live_order_board.order_list).to eq([])
    end

    it 'does not remove order from list when its user_id is not equal to the given user_id' do
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      live_order_board.remove_order('antonio')
      expect(live_order_board.order_list).to eq([order_data])
    end
  end
end
