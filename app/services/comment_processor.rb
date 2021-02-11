class CommentProcessor
  def process_comments
    Comment.unprocessed.find_each do |comment|
      process(comment)
    end
  end

  private

  def process(comment)
    Rails.logger.debug("Process comment #{comment.id}")

    tickers = TickerMatcher.extract_tickers(comment.body)
    return processing_finished(comment) if tickers.empty?

    Rails.logger.debug("Comment #{comment.id} returned #{tickers}")

    tickers.each do |ticker|
      save_ticker_mention(comment, ticker)
    end

    processing_finished(comment)
  end

  def save_ticker_mention(comment, ticker)
    instrument = Instrument.find_or_create_by(short: ticker)
    return if instrument.invalid_ticker?

    InstrumentMention.create(
      instrument_id: instrument.id,
      comment_id: comment.id
    )
  end

  def processing_finished(comment)
    comment.update(processed: true)
  end
end
