class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|

      t.string :handle
      t.string :tweet_text, :string, :limit => 1000
      t.string :tweet_embed, :string, :limit => 1000
      t.string :category_id
      t.boolean :is_retweet
      t.boolean :has_link
      t.boolean :has_image
      t.boolean :is_reply
      t.boolean :has_hashtags
      t.string :hashtags
      t.string :geo
      t.string :language

      t.timestamps null: false
    end
  end
end
