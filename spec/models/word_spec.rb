require 'rails_helper'

describe Word do
  subject { Word.new('foxes', 'fox') }
  it 'initializes with id and root' do
    expect(subject).to be_a Word
  end
end
