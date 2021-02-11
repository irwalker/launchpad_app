class InstrumentMention < ApplicationRecord
  belongs_to :instrument
  belongs_to :comment
end
