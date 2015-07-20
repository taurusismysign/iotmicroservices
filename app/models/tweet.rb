class Tweet < ActiveRecord::Base

  def self.findtweets(cat, filter={},page)

    tweets = Tweet.where(:category_string=>cat).order('tweets.id DESC').offset(page.to_i * 9).limit(9)

    if filter.present?

      if filter['timeline'].present?
        if filter['timeline'] == 'h'
          tweets = tweets.where("tweets.created_at > ?", (Time.now-1))
        elsif filter['timeline'] == 'w'
          tweets = tweets.where("tweets.created_at > ?", 7.days.ago)
        elsif filter['timeline'] == 'm'
          tweets = tweets.where("tweets.created_at > ?", 30.days.ago)
        elsif filter['timeline'] == 't'
          tweets = tweets.where("tweets.created_at > ?", Date.today)
        end
      end

      # tweettype filter
      if filter['tweettype'].present?
        if filter['tweettype']['0'].present? && filter['tweettype']['0'] == 'tweet' && filter['tweettype']['1'].blank?
          # include tweets only
          tweets = tweets.where("is_retweet = ?", 0)
        elsif filter['tweettype']['0'].present? && filter['tweettype']['0'] == 'retweet' && filter['tweettype']['1'].blank?
          # include retweets only
          tweets = tweets.where("is_retweet = ?", 1)
        end
      end

      # media filter
      if filter['media'].present?
        mlist = filter['media'].map {|k,vs| vs}.join(",").split(',')
        if mlist.include? 'link'
          tweets = tweets.where("has_link = ?", 1)
        end
        if mlist.include? 'image'
          # include retweets only
          tweets = tweets.where("has_image = ?", 1)
        end
      end

      # intent
      if filter['intent'].present?
        intentList = filter['intent'].map {|k,vs| vs}.join(",").split(',')

        if intentList.include? 'reply'
          tweets = tweets.where("is_reply = ?", 1)
        end
        if intentList.include? 'hashtag'
          tweets = tweets.where("has_hashtags = ?", 1)
        end
        if intentList.include? 'sensitive'
          tweets = tweets.where("is_sensitive = ?", 1)
        end
      end
    else
      # by default pull 30 days old data
      tweets = tweets.where("tweets.created_at > ?", 30.days.ago)
    end

    tweets
  end

end
