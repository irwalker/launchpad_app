namespace :launchpad do
  namespace :reddit do
    desc 'Stream tickers from a subreddit'
    task stream: :environment do
      subreddit = ARGV[1]
      raise 'Subreddit argument is mandatory' unless subreddit

      RedditStream.new(subreddit).stream
    end
  end
end
