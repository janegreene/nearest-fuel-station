require 'rails_helper'

RSpec.describe "As a user" do
  describe "and select turing as a start location " do
    it "can find nearest station" do
      visit '/'
      select 'Turing', from: 'location'
      click_button "Find Nearest Station"
      expect(current_path).to eq(search_path)

      expect(page).to have_css('.name')
      name = find('.name').value
      expect(name).not_to be_empty

      expect(page).to have_css('.address')
      address = find('.address').value
      expect(address).not_to be_empty

      expect(page).to have_css('.fuel-type')
      fuel = find('.fuel-type').value
      expect(fuel).not_to be_empty

      expect(page).to have_css('.access-time')
      access = find('.access-time').value
      expect(access).not_to be_empty

      expect(page).to have_css('.distance')
      distance = find('.distance').value
      expect(distance).not_to be_empty

      expect(page).to have_css('.travel-time')
      time = find('.travel-time').value
      expect(time).not_to be_empty

      expect(page).to have_css('.directions')
      directions = find('.directions').value
      expect(directions).not_to be_empty

      # this style is fine for now but she cautions expecting real values is a "brittle" test
      # expect(page).to have_content("Seventeenth Street Plaza")
      # expect(page).to have_content("1225 17th St.")
      # expect(page).to have_content("Denver")
      # expect(page).to have_content("ELEC")
      # expect(page).to have_content("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
      # expect(page).to have_content(".081")
      # expect(page).to have_content("00:00:40")
      # expect(page).to have_content("Start out going southeast on 17th St toward Larimer St/CO-33.")
      # expect(page).to have_content("1225 17TH ST is on the right.")
    end
  end
end
