# Learn more: http://github.com/javan/whenever

every 5.minutes do
  # re-run reddit streams every 5 minutes or so to make sure they keep streaming
  runner "RedditStream.stream('wallstreetbets')"
  runner "RedditStream.stream('stocks')"
  runner "RedditStream.stream('investing')"
  runner "RedditStream.stream('finance')"
  runner "RedditStream.stream('stock_picks')"
end
