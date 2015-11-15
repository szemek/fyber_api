require 'rails_helper'

describe OffersDecorator do
  context 'empty collection' do
    subject { described_class.new }

    it 'returns true for #empty? method' do
      expect(subject.empty?).to be(true)
    end
  end

  context 'collection with offer(s)' do
    let(:offer) do
      {
        'title' => 'Offer',
        'thumbnail' => { 'lowres' => 'http://url/to/image.png' },
        'payout' => 12345
      }
    end

    subject { described_class.new([offer]) }

    it 'returns true for #empty? method' do
      expect(subject.empty?).to be(false)
    end

    it 'returns Offer object' do
      first_offer = subject.first

      expect(first_offer.title).to eq('Offer')
      expect(first_offer.lowres).to eq('http://url/to/image.png')
      expect(first_offer.payout).to eq(12345)
    end
  end
end
