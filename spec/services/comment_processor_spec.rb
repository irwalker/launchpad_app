require 'rails_helper'

RSpec.describe CommentProcessor do
  let(:processor) { CommentProcessor.new }

  describe '#process_comments' do
    subject { processor.process_comments }

    let!(:instrument) { create(:instrument) }

    before do
      5.times { create(:comment) }
    end

    it 'should process 5 mentions of GME' do
      subject

      mentions = InstrumentMention.where(instrument_id: instrument.id)
      expect(mentions.size).to eq(5)
    end
  end
end
