module Api
  class Offer
    attr_reader :params

    def initialize(params = {})
      @params = default_params.merge(params)
    end

    def call
      JSON.parse(response.body).symbolize_keys
    end

    private

    def response
      connection.get('/feed/v1/offers.json', params.merge(hashkey: hashkey))
    end

    def hashkey
      HashkeyCalculator.new(params, api_key).call
    end

    def api_key
      ENV.fetch('FYBER_API_KEY')
    end

    def connection
      Faraday.new(url: 'http://api.fyber.com')
    end

    def default_params
      {
        appid: 157,
        format: 'json',
        device_id: '2b6f0cc904d137be2e1730235f5664094b83',
        locale: 'de',
        ip: '109.235.143.113',
        offer_types: 112,
        timestamp: Time.now.to_i,
      }
    end
  end
end
