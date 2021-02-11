namespace :launchpad do
  namespace :process do
    desc 'Process downloaded comments'
    task comments: :environment do
      CommentProcessor.new.process_comments
    end
  end
end
