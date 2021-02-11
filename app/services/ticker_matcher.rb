class TickerMatcher
  def self.extract_tickers(text)
    matches = text.scan(%r{\$?([A-Z]{1,4})\W})
    matches.flatten.uniq - not_real_tickers
  end

  def self.not_real_tickers
    %w(OK I DD WSB IRA YOU MUST BUY HATS WHAT PENS VERY HOLD DM)
  end
end
