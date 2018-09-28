class ProofreadingApi
  #include ApiModule
  include ActiveModel::Model

  require 'httpclient'

  attr_accessor :text

  validates :text, presence: true, length: {maximum: 500}

  def request
    res = self.call_get_api
    p JSON.parse(res.body)
  end

  def call_get_api
    api_key = Rails.application.secrets.api_key
    uri = "https://api.a3rt.recruit-tech.co.jp/proofreading/v2/typo"

    params = {
        apikey: api_key,
        sentence: self.text
    }

    client = HTTPClient.new
    client.get(uri, params)
  end

end
