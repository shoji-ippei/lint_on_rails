class ProofreadingApisController < ApplicationController

  def index
  end

  def show
    @proofreading = ProofreadingApi.new(api_params)

    #アプリ側のエラーをさばく
    begin
      response = @proofreading.valid? ? @proofreading.request : @proofreading.errors.full_messages.join("\n")
    rescue => e
      response = "アプリケーションエラー：[#{e.class}]#{e.message}"
    end

    render partial: 'result', locals: {lint_text: response}
  end

  private

  def api_params
    params.permit(:text)
  end
end
