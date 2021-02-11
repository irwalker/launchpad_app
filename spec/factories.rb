FactoryBot.define do
  factory :task_runner do
    task_name { RedditStream::TASK_NAME }
    feed_name { 'wallstreetbets' }
    running { false }
  end
end
