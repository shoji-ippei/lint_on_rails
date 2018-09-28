module ApiModule
  prepend ApiStub if ENV["APIMODE"] == "mock" && Rails.env.development?
 
  def call_get_api
    # ここに本来の外部API呼び出しの実装が入る
    p "calling api"
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
