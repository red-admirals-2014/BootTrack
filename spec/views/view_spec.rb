require 'spec_helper'

feature 'User browse' do
  context 'Testing search' do
    it 'can click on location to see a drop down of NYC, SF, CHI' do
      visit root_path
      select('San Francisco', from: 'select')
      click_on 'Search'
      expect(page).to have_content 'Boot Track'
    end
  end
end
