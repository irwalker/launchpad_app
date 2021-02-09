class RedditClient
  include Singleton

  attr_reader :client

  def initialize
    @client = Redd.it(
      user_agent: 'Redd:RandomBot:v1.0.0 (by /u/Mustermind)',
      client_id: ENV['CLIENT_ID'],
      secret: ENV['SECRET'],
      username: ENV['USERNAME'],
      password: ENV['PASSWORD']
    )
  end
end
