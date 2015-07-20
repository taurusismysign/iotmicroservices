require 'httparty'

module Submitter

  # returns submission object
  def self.Add(tweet, exp, embed)
    #t = Tweet.new

    #t.handle = tweet[:user][:screen_name].downcase
    #t.category_string = exp['category_string']
    #t.tweet_text = tweet[:attrs][:retweeted_status].present? ? tweet[:attrs][:retweeted_status][:text] : tweet[:attrs][:text]
    #t.is_retweet = tweet[:attrs][:retweeted_status].present? ? 1 : 0
    #t.has_link = tweet[:attrs][:entities][:urls].present? ? 1 : 0
    #t.has_hashtags = tweet[:attrs][:entities][:hashtags].present? ? 1 : 0
    #t.hashtags = tweet[:attrs][:entities][:hashtags].present? ? tweet[:attrs][:entities][:hashtags] : ""

    #t.tweet_embed = embed[:attrs][:html]
    #t.has_image = tweet[:attrs][:entities][:media].present? ? 1 : 0
    #t.is_reply = tweet[:attrs][:in_reply_to_status_id].present? ? 1 : 0

    #t.save

    #return t

    #this should now use a service and push the new tweet to it


    @result = HTTParty.post("http://localhost:3012/tweets.json",
                            :body => { :handle => tweet[:user][:screen_name].downcase,
                                       :category_string => exp['category_string'],
                                       :tweet_text => tweet[:attrs][:retweeted_status].present? ? tweet[:attrs][:retweeted_status][:text] : tweet[:attrs][:text],
    :is_retweet => tweet[:attrs][:retweeted_status].present? ? 1 : 0,
    :has_link => tweet[:attrs][:entities][:urls].present? ? 1 : 0,
    :has_hashtags => tweet[:attrs][:entities][:hashtags].present? ? 1 : 0,
    :hashtags => tweet[:attrs][:entities][:hashtags].present? ? tweet[:attrs][:entities][:hashtags] : "",
    :tweet_embed => embed[:attrs][:html],
    :has_image => tweet[:attrs][:entities][:media].present? ? 1 : 0,
    :is_reply => tweet[:attrs][:in_reply_to_status_id].present? ? 1 : 0
    }.to_json,
                            :headers => { 'Content-Type' => 'application/json' } )

    return @result
  end
end
