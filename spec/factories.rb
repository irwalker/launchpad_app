FactoryBot.define do
  factory :comment do
    reddit_id { 'aaa-bbb-ccc' }
    body { 'GME is going to the moon!' }
    author_name { 'shitposter69' }
    subreddit_name { 'wallstreetbets' }
    number_of_replies { 0 }
    upvotes { 1 }
    downvotes { 0 }
    score { 0 }
    processed { false }
  end

  factory :instrument do
    short { 'GME' }
    name { 'Gamestop' }
    description { 'This stock is going to the moon 100%' }
    verified { true }
  end

  factory :task_runner do
    task_name { RedditStream::TASK_NAME }
    feed_name { 'wallstreetbets' }
    running { false }
  end
end
