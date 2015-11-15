require 'rails_helper'

describe OffersController do
  context '#index action for valid response' do
    let(:params) do
      {
        uid: 'player1',
        pub0: 'campaign2',
        page: 1
      }
    end

    before { Timecop.freeze(Time.parse('2015-11-14 23:12:00 +0100')) }
    after { Timecop.return }

    it 'renders :index template' do
      VCR.use_cassette('offers_valid_response') do
        post :index, params

        expect(response).to render_template(:index)
      end
    end
  end

  context '#index action for invalid response' do
    before { Timecop.freeze(Time.parse('2015-11-14 23:25:00 +0100')) }
    after { Timecop.return }

    it 'sets flash[:notice] and redirects' do
      VCR.use_cassette('offers_invalid_uid_response') do
        post :index

        expect(flash[:notice]).to eq('Invalid response')
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
