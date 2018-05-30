require 'rails_helper'

describe WordSearch do
  subject { WordSearch.new("foxes") }
  it 'initializes when passed a word' do
    expect(subject).to be_a WordSearch
  end

  describe 'instance methods' do
    describe '#word' do
      it 'returns a word object based on a search' do
        VCR.use_cassette('word-search-word') do
          expect(subject.word).to be_a Word
        end
      end
    end
  end
end
