require 'rails_helper'

RSpec.describe CommentProcessor do
  let(:processor) { CommentProcessor.new }

  describe '#process_comments' do
    subject { processor.process_comments }

    let!(:instrument) { create(:instrument) }



    context 'when a single instrument is mentioned several times' do
      before { 5.times { create(:comment) } }

      it 'should process 5 mentions of GME' do
        subject

        mentions = InstrumentMention.where(instrument_id: instrument.id)
        expect(mentions.size).to eq(5)
      end
    end

    context 'when multiple instruments are mentioned' do
      before do
        create(
          :comment,
          body: 'I like GME but also F and others like BB'
        )
      end

      it 'should process mentions for 3 different instruments' do
        subject

        mentions = InstrumentMention.all
        expect(mentions.size).to eq(3)

        %w(GME F BB).each do |ticker|
          mention = mentions.find { |m| m.instrument.short == ticker }
          expect(mention).to_not be nil
        end
      end
    end
  end
end
