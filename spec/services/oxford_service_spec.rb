require 'rails_helper'

describe OxfordService do
  subject { OxfordService.new('foxes') }
  it 'initializes with word' do
    expect(subject).to be_a OxfordService
  end
end
