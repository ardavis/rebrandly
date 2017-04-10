require "spec_helper"

describe Rebrandly do
  it "has a version number" do
    expect(Rebrandly::VERSION).not_to be nil
  end

  describe '#configure' do
    before do
      Rebrandly.configure do |config|
        config.api_key = '123456789'
      end
    end

    it 'has a configurable api key' do
      key = Rebrandly.api_key
      expect(key).to eq '123456789'
    end
  end
end
