require 'live_order_board'

describe do LiveOrderBoard

  let(:fake_order) { double(:order) }
  let(:new_order) { double(:new_order)}
  let(:live_order_board) { LiveOrderBoard.new(fake_order) }

  describe '#register_order' do
    it 'call #new in fake_order' do
      allow(fake_order).to receive(:new)
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      expect(fake_order).to have_received(:new).with('fran', 4.5, 1500, 'BUY')
    end

    it 'call #add_to_order_list on live_order_board' do
      allow(fake_order).to receive(:new)
      allow(live_order_board).to receive(:add_to_order_list)
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      expect(live_order_board).to have_received(:add_to_order_list)
    end
  end
end
