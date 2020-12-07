class BotController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def index
    body = params['Body'].downcase
    response = Twilio::TwiML::MessagingResponse.new
    response.message { |msg| msg.body(MessageHandler.new(body).call) }
    respond_to { |format| format.xml { render xml: response } }
  end
end
