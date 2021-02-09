class InitialSchema < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :reddit_id
      t.text :body
      t.string :author_name
      t.string :subreddit_name
      t.integer :replies_to_id
      t.integer :number_of_replies
      t.integer :upvotes
      t.integer :downvotes
      t.integer :score
      t.integer :controversiality
      t.string :listing_name
      t.integer :listing_id

      t.timestamps

      t.index :reddit_id
    end

    create_table :mentions do |t|
      t.integer :comment_id
      t.string :ticker

      t.timestamps
    end

    create_table :instruments do |t|
      t.string :ticker
      t.string :name
    end
  end
end
