require 'spec_helper'

feature "Date and Time", type: :feature do

  scenario "I want to see the date and time I added a peep" do
    sign_up
    add_peep

    within 'ul#peeps' do
      expect(page).to have_content("This is my second peep")
      expect(page).to have_content(Time.new.strftime("%d/%m/%Y" " %H:%M"))
    end
  end
end
