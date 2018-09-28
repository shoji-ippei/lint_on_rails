class ProofreadingApisController < ApplicationController

  def index
  end

  def show
    @res = ProofreadingApi.new(api_params)

    if @res.valid?
      @lint_text = @res.request["checkedSentence"]
      render partial: 'result', locals: {lint_text: @lint_text}
    else
      @res.errors.messages
    end
  end

  private

  def api_params
    params.permit(:text)
  end
end
