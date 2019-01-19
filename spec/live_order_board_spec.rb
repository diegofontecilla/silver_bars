require 'live_order_board'

describe do

  let(:fake_order) { double(:order) }
  let(:live_order_board) { LiveOrderBoard.new(fake_order) }

  describe '#register_order' do
    it 'to have received #new with 4 argumtents' do
      allow(fake_order).to receive(:new)
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      expect(fake_order).to have_received(:new).with('fran', 4.5, 1500, 'BUY')
    end
  end
end
