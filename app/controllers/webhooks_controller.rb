class WebhooksController < ApplicationController
protect_from_forgery with: :null_session
skip_before_filter  :verify_authenticity_token
  def webhook
      @bt_signature = params[:bt_signature]
      @bt_payload = params[:bt_payload]
      webhook_notification = Braintree::WebhookNotification.parse(
        @bt_signature,
        @bt_payload
      )
      return 200
  end
end
