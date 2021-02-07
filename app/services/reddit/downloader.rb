class Reddit
  class Downloader
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    def save_new_comments_for_subreddit(subreddit_name)
      client.subreddit(subreddit_name).tap do |subreddit|
        subreddit.hot.each do |listing|
          parse_comments_for_listing(listing)
        end
      end
    end

    private

    def parse_comments_for_listing(listing)
      binding.pry
    end
  end
end
