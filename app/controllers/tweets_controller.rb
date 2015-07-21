class TweetsController < ApplicationController
  allow_cors :index, :filtertweet

  def index

    if params[:id].present?
      @cat = params[:id]
    else
      @cat = 'sports'
    end
    @tweets = Tweet.findtweets(@cat,nil,0)

    #SyncData.process

  end

  def create
    @t = Tweet.new message_params
    @t.save
    render :nothing => true
  end

  def filtertweet
    if params[:category].present?
      @tweets = Tweet.findtweets(params[:category], params[:filter], params[:page])
      @mode = params[:mode]
    end
  end

  private
  def message_params
    params.require(:tweet).permit(:handle, :category_string, :tweet_text,
                                  :is_retweet, :has_link, :has_hashtags,
                                  :hashtags,:tweet_embed,:has_image, :is_reply)
  end

end


