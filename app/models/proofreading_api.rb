class ProofreadingApi
  #include ApiModule
  include ActiveModel::Model
  include ActiveModel::Validations

  require 'httpclient'

  attr_accessor :text

  validates :text, presence: true, length: {maximum: 500}

  def request
    api_key = Rails.application.secrets.api_key
    uri = Rails.application.secrets.proofreading_uri

    params = {
        apikey: api_key,
        sentence: self.text
    }
    client = HTTPClient.new
    res = client.get(uri, params)

    return validate_result(JSON.parse(res.body))
  end

  private

  # API側のエラーレスポンスをさばく
  def validate_result(response_body)
    response_body['checkedSentence'].present? ? mark(response_body['checkedSentence']) : "エラー：コード#{response_body['status']}"
  end

  def mark(checked_sentense)
    if checked_sentense =~ /^.*(\s<<)|^.*(>>\s)/
      checked_sentense.gsub!(checked_sentense.match(/^.*(\s<<)/)[1], '<mark>')
      checked_sentense.gsub!(checked_sentense.match(/^.*(>>\s)/)[1], '</mark>')
    end

    return checked_sentense
  end
end
