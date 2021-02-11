class Comment < ApplicationRecord
  has_many :instrument_mentions

  scope :unprocessed, -> { where(processed: false) }
end
