require 'exceptions/connector_api_error'
require 'exceptions/connector_connection_error'
require 'twitter'

class TwitterConnector

  def initialize( consumer_key, consumer_secret, oauth_key, oauth_verifier)
    begin
      # connect to twitter and get the data
      @twclient = Twitter::REST::Client.new(
        :access_token => oauth_key,
            :access_token_secret => oauth_verifier,
            :consumer_key => consumer_key,
            :consumer_secret => consumer_secret
      )

    rescue Twitter::Error => te
      raise ConnectorConnectionError.new("Couldn't connect to Twitter")
    end

    @pull_count = 100
  end

  def embed(id)
    @twclient.oembed(id,{omit_script: true})
  end

  def follow_account(acc)
    begin
      @twclient.follow(acc)
      return true
    rescue Twitter::Error => e
      return false
    end
  end

  def timeline(handle, since_id, pull_all)
    begin
    if pull_all then
      @twclient.home_timeline({count: @pull_count, since_id: since_id, exclude_replies: true})
    else
      @twclient.user_timeline(handle, {count: @pull_count, since_id: since_id, exclude_replies: true})
    end
    rescue Twitter::Error => e
      raise ConnectorApiError.new(e.message)
    end
  end

end
