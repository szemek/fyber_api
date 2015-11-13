require 'rails_helper'

describe HashkeyCalculator do
  let(:params) do
    {
      appid: 157,
      uid: 'player1',
      ip: '212.45.111.17',
      locale: 'de',
      device_id: '2b6f0cc904d137be2e1730235f5664094b831186',
      ps_time: 1312211903,
      pub0: 'campaign2',
      page: 2,
      timestamp: 1312553361
    }
  end

  let(:api_key) { 'e95a21621a1865bcbae3bee89c4d4f84' }

  let(:sha1) { '7a2b1604c03d46eec1ecd4a686787b75dd693c4d' }

  it 'returns calculated SHA1' do
    expect(described_class.new(params, api_key).call).to eq(sha1)
  end
end
