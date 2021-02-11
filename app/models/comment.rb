class Comment < ApplicationRecord
  has_many :instrument_mentions
end
