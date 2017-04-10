require "spec_helper"

describe Rebrandly do
  describe Configuration do
    describe '#api_key' do
      it 'has a default value of nil' do
        Configuration.new.api_key = nil
      end
    end

    describe '#api_key=' do
      it 'can set value' do
        config = Configuration.new
        config.api_key = '123456789'
        expect(config.api_key).to eq '123456789'
      end
    end
  end
end
