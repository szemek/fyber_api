class HashkeyCalculator
  attr_reader :params, :api_key

  def initialize(params, api_key)
    @params = params
    @api_key = api_key
  end

  def call
    Digest::SHA1.hexdigest(input)
  end

  private

  def input
    (chunks + [api_key]).join('&')
  end

  def chunks
    params.keys.sort.map { |key| "#{key}=#{params[key]}" }
  end
end
