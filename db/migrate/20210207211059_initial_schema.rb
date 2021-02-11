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
      t.boolean :processed, default: false

      t.timestamps

      t.index :processed
    end

    create_table :task_runners do |t|
      t.string :task_name
      t.string :feed_name
      t.boolean :running, default: false
    end

    create_table :instruments do |t|
      t.string :short
      t.string :name
      t.text :description
      t.boolean :verified, default: false
      t.boolean :invalid_ticker, default: false

      t.index :short
    end

    create_table :instrument_mentions do |t|
      t.references :comment
      t.references :instrument

      t.timestamps
    end
  end
end
