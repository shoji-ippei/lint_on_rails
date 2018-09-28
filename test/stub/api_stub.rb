module ApiStub
  WebMock.enable!
 
  # アプリケーションコードに`call_get_api`という名称の外部API呼び出し実装を含むメソッドがあることして、ここで同名のメソッドを作成してstub登録します。  
  def call_get_api
    p "define stub"
    api_key = Rails.application.secrets.api_key
    WebMock.stub_request(:get, "api.a3rt.recruit-tech.co.jp/proofreading/v2/typo").to_return(
      body: File.read("#{Rails.root}/test/fixtures/stub_api_response.json"),
      status: 200,
      headers: { 'Content-Type' =>  'application/json' }
    )

    super # アプリケーションコードの実装を呼び出す
  end
end 
