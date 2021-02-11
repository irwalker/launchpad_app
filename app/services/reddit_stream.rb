class RedditStream
  TASK_NAME = 'reddit_stream'.freeze

  attr_reader :client, :subreddit_name
  private :client, :subreddit_name

  def initialize(subreddit_name)
    @subreddit_name = subreddit_name
    @client = RedditClient.instance.client
  end

  def stream
    if TaskRunner.task_running?(TASK_NAME, subreddit_name)
      Rails.logger.info("#{TASK_NAME}:#{subreddit_name} already running")
      return
    end

    begin
      task_runner.update(running: true)

      subreddit.comments.stream do |comment|
        save_comment(comment)
      end
    ensure
      task_runner.update(running: false)
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

  def task_runner
    @task_runner ||= TaskRunner.find_by(task_name: TASK_NAME, feed_name: subreddit_name)
  end
end
