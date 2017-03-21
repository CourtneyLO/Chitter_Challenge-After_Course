require 'spec_helper'

feature "Add Peep", type: :feature do

  before do
    sign_up
  end

  scenario "I want to be able to add a peep when I am logged in" do
    expect(current_path).to eq('/')
    expect{ add_peep }.to change(Peep, :count).by(2)
    within 'ul#peeps' do
      expect(page).to have_content("This is my first peep")
      expect(page).to have_content("This is my second peep")
    end
  end

  scenario 'I want to be able to view the peeps without logging in' do
    add_peep
    click_button("Log Out")

    visit('/')
    within 'ul#peeps' do
      expect(page).to have_content("This is my first peep")
      expect(page).to have_content("This is my second peep")
    end
  end

end
