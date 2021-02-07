class Reddit
  attr_reader :client
  private :client

  def initialize
    @client = Redd.it(
      user_agent: 'Redd:RandomBot:v1.0.0 (by /u/Mustermind)',
      client_id: ENV['CLIENT_ID'],
      secret: ENV['SECRET'],
      username: ENV['USERNAME'],
      password: ENV['PASSWORD']
    )
  end

  def stream_subreddits
    downloader = Downloader.new(client)
    %w(wallstreetbets stocks investing dividends).each do |subreddit|
      downloader.save_new_comments_for_subreddit(subreddit)
    end
  end
end
