require 'rails_helper'

RSpec.describe "As a user" do
  describe "and select turing as a start location " do
    it "can find nearest station" do
      visit '/'
      select 'Turing', from: 'location'
      click_button "Find Nearest Station"
      expect(current_path).to eq(search_path)

      # Then I should see the closest electric fuel station to me.
      # For that station I should see
      expect(page).to have_content("Seventeenth Street Plaza")
      expect(page).to have_content("1225 17th St.")
      expect(page).to have_content("Denver")
      expect(page).to have_content("ELEC")
      expect(page).to have_content("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
      expect(page).to have_content(".081")
      expect(page).to have_content("00:00:40")
      expect(page).to have_content("Start out going southeast on 17th St toward Larimer St/CO-33.")
      expect(page).to have_content("1225 17TH ST is on the right.")
    end
  end
end

# As a user
# When I visit "/"
# And I select "Turing" form the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1 min)
# - The direction instructions to get to that fuel station
#   "Turn left onto Lawrence St Destination will be on the left"
