class OffersDecorator
  include Enumerable

  Offer = Struct.new(:title, :lowres, :payout)

  attr_reader :collection

  def initialize(collection = [])
    @collection = collection.map do |e|
      Offer.new(e['title'], e['thumbnail']['lowres'], e['payout'])
    end
  end

  def each
    collection.each { |e| yield(e) }
  end

  def empty?
    collection.empty?
  end
end
