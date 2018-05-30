require 'rails_helper'

describe 'User' do
  describe 'submits a valid word' do
    it 'and find its root' do
      VCR.use_cassette('user-word-search-valid') do
        # As a guest user (no sign in necessary)
        # When I visit "/"
        visit '/'

        # And I fill in a text box with "foxes"
        fill_in "word", with: "foxes"
        # And I click "Validate Word"
        click_on "Validate Word"

        # Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
        expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
      end
    end
  end

  describe 'submits an invalid word' do
    it 'returns a message that the word was invalid' do
      VCR.use_cassette('user-word-search-invalid') do
        # When I visit "/"
        visit '/'

        # And I fill in a text box with "foxez"
        fill_in "word", with: "foxez"
        # And I click "Validate Word"
        click_on "Validate Word"

        # Then I should see a message that says "'foxez' is not a valid word."
        expect(page).to have_content("'foxez' is not a valid word.")
      end
    end
  end
end
