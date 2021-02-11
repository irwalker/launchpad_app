require 'rails_helper'

RSpec.describe TickerMatcher do
  describe 'extract_tickers' do
    subject { TickerMatcher.extract_tickers(text) }

    context 'match text contains 1-4 capital letters' do
      let(:text) {
        'Friendly reminder: keep all GME comments in the GME megathread. AAPL and BB are fine. ' \
          'F is OK too'
      }

      it { is_expected.to eq(['GME', 'AAPL', 'BB', 'F']) }
    end

    context 'with tickers starting with $' do
      let(:text) { 'Friendly reminder: keep all $GME comments in the $GME megathread' }

      it { is_expected.to eq(['GME']) }
    end

    context 'mix and matching $ and no $ in the ticker' do
      let(:text) { 'Friendly reminder: keep all $GME comments in the GME megathread' }

      it { is_expected.to eq(['GME']) }
    end

    context 'with trap characters like OK and I' do
      let(:text) { 'I am not sure about whether this is OK' }

      it { is_expected.to eq([]) }
    end
  end
end
