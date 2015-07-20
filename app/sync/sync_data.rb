require 'httparty'

class SyncData


  def self.follow

    @experts = Expert.limit(10)

    t = TwitterSync.new
    t.Follow(@experts)
  end

  def self.process

    #DEVELOPER NOTE:
    #Get all the tweets. Later on we could horizontally split it
    #to scale by pulling experts based on certain filter criteria
    #for each horizontal process

    #connect to the "catalog" service and get all the experts

    response = HTTParty.get("http://localhost:3012/experts.json", {timeout: 15})
    t = TwitterSync.new
    t.SyncTweets(response.body)
  end

end