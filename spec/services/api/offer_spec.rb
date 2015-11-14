require 'rails_helper'

describe Api::Offer do
  let(:params) do
    {
      uid: 'player1',
      pub0: 'campaign2',
      page: 1
    }
  end

  subject { described_class.new(params) }

  context 'valid response with offers' do
    before { Timecop.freeze(Time.parse('2015-11-14 23:12:00 +0100')) }
    after { Timecop.return }

    it 'returns hash with proper keys' do
      VCR.use_cassette('offers_valid_response') do
        expect(subject.call.keys).to match_array([:code, :count, :information, :message, :offers, :pages])
      end
    end
  end

  context 'invalid response because of timestamp' do
    before { Timecop.freeze(Time.parse('2014-01-01 00:00:00 +0100')) }
    after { Timecop.return }

    let(:response) { subject.call }

    it 'returns hash with proper keys' do
      VCR.use_cassette('offers_invalid_timestamp_response') do
        expect(response.keys).to match_array([:code, :message])
        expect(response[:code]).to eq('ERROR_INVALID_TIMESTAMP')
        expect(response[:message]).to eq('An invalid or expired timestamp was given as a parameter in the request.')
      end
    end
  end

  context 'invalid response because of missing uid' do
    before { Timecop.freeze(Time.parse('2015-11-14 23:25:00 +0100')) }
    after { Timecop.return }

    subject { described_class.new }

    let(:response) { subject.call }

    it 'returns hash with proper keys' do
      VCR.use_cassette('offers_invalid_uid_response') do
        expect(response.keys).to match_array([:code, :message])
        expect(response[:code]).to eq('ERROR_INVALID_UID')
        expect(response[:message]).to eq('An invalid user id (uid) was given as a parameter in the request.')
      end
    end
  end
end
