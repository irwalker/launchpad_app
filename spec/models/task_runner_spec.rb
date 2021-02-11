require 'rails_helper'

RSpec.describe TaskRunner, type: :model do
  describe '#task_running?' do
    subject { TaskRunner.task_running?(task_name, feed_name) }

    let!(:task) { create(:task_runner, running: is_running) }

    let(:task_name) { RedditStream::TASK_NAME }
    let(:feed_name) { 'wallstreetbets' }
    let(:is_running) { true }

    it { is_expected.to be true }

    context 'when the task is not running' do
      let(:is_running) { false }

      it { is_expected.to be false }
    end
  end
end
