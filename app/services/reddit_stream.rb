class RedditStream
  attr_reader :client, :subreddit_name
  private :client, :subreddit_name

  def initialize(subreddit_name)
    @subreddit_name = subreddit_name
    @client = RedditClient.instance.client
  end

  def stream
    subreddit.comments.stream do |comment|
      save_comment(comment)
    end
  end

  private

  def save_comment(comment)
    Rails.logger.debug("Saving #{comment.body}")

    Comment.create(
      reddit_id: comment.id,
      body: comment.body,
      author_name: comment.author.name,
      subreddit_name: subreddit_name,
      score: comment.score,
      controversiality: comment.controversiality,
    )
  end

  def subreddit
    client.subreddit(subreddit_name)
  end
end
