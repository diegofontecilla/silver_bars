require 'live_order_board'

describe do LiveOrderBoard

  order_data = {:user_id=>"fran", :order_quantity=>4.5,
                :price_per_kl=>1500, :order_type=>"BUY"}

  let(:new_order) { double(:new_order, :get_order => order_data)}
  let(:order) { double(:order, :new => new_order) }
  let(:summary) { double(:summary) }
  let(:live_order_board) { LiveOrderBoard.new(order, summary) }

  describe '#register_order' do
    it 'call #new on order' do
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      expect(order).to have_received(:new)
    end

    it 'call #add_to_order_list on live_order_board' do
      allow(live_order_board).to receive(:add_to_order_list)
      live_order_board.register_order('fran', 4.5, 1500, 'BUY')
      expect(live_order_board).to have_received(:add_to_order_list)
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

    describe '#get_summary_information' do
      it 'calls #get_summary_information on instance of summary class' do
        allow(summary).to receive(:get_summary_information)
        live_order_board.get_summary_information
        expect(summary).to have_received(:get_summary_information)
      end
    end
  end

end
