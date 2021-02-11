class TickerMatcher
  def self.extract_tickers(text)
    matches = text.scan(%r{\$?([A-Z]{1,4})(\W|\z)})
    (matches.flatten.compact.uniq - not_real_tickers).reject(&:blank?)
  end

  def self.not_real_tickers
    %w(OK I DD WSB IRA YOU MUST BUY HATS WHAT PENS VERY HOLD DM)
  end
end
