class RedditClient
  include Singleton

  attr_reader :client

  def initialize
    @client = Redd.it(
      user_agent: 'Redd:RandomBot:v1.0.0 (by /u/Mustermind)',
      client_id: Rails.application.credentials.reddit_client_id,
      secret: Rails.application.credentials.reddit_client_secret,
      username: Rails.application.credentials.reddit_username,
      password: Rails.application.credentials.reddit_password
    )
  end
end
