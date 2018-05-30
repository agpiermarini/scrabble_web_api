require 'rails_helper'

describe OxfordService do
  subject { OxfordService.new('foxes') }
  it 'initializes with word' do
    expect(subject).to be_a OxfordService
  end

  describe 'class methods' do
    describe '#status' do
      it 'returns status' do
        VCR.use_cassette('oxford-service-status') do
          expect(subject.status).to eq(200)
          expect(subject.word_info).to be_a Hash
        end
      end
    end

    describe '#word_info' do
      it 'returns hash with word information' do
        VCR.use_cassette('oxford-service-word-info') do
          expect(subject.word_info).to be_a Hash
        end
      end
    end
  end
end
