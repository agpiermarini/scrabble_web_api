require 'rails_helper'

describe GameScore do
  subject { GameScore.new({}) }
  it 'initializes' do
    expect(subject).to be_a GameScore
  end
end
