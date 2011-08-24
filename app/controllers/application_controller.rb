require 'twitter/authentication_helpers'

class ApplicationController < ActionController::Base
  include Twitter::AuthenticationHelpers
  protect_from_forgery
  rescue_from Twitter::Unauthorized, :with => :force_sign_in

  private

  def oauth_consumer
    @oauth_consumer ||= OAuth::Consumer.new("mnmqPcekeflGWC7xiZMdKg", "R1Vm2PEziIVYyU8xVaoxv3Y4EgR1MkrCzEgs0ciP0", :site => 'http://api.twitter.com', :request_endpoint => 'http://api.twitter.com', :sign_in => true)
  end

  def client
    Twitter.configure do |config|
      config.consumer_key = "mnmqPcekeflGWC7xiZMdKg"
      config.consumer_secret = "R1Vm2PEziIVYyU8xVaoxv3Y4EgR1MkrCzEgs0ciP0"
      config.oauth_token = session['access_token']
      config.oauth_token_secret = session['access_secret']
    end
    @client ||= Twitter::Client.new
  end
  helper_method :client

  def force_sign_in(exception)
    reset_session
    flash[:error] = "It seems your credentials are not good anymore. Please sign in again."
    redirect_to new_session_path
  end
end
