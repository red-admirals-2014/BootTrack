require 'spec_helper'

feature 'User browse' do
  context 'Testing search' do
    pending
    it 'can click on location to see a drop down of NYC, SF, CHI' do
      visit root_path
      select('San Francisco', from: 'location')
      expect(page).to have_select('location', selected: 'San Francisco')
      click_on 'Search'
      expect(page).to have_content 'Kelley Puckett'
    end
  end
end
