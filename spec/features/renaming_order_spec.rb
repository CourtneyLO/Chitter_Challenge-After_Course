require 'spec_helper'

feature "Changing Order", type: :feature do

  before do
    sign_up
    add_peep
    visit ('/')
  end

  scenario 'I want to be able to see the lastest peep first' do

      expect(page).to have_selector("ul#peeps li:nth-child(1)", text: "This is my second peep")
      expect(page).to have_selector("ul#peeps li:nth-child(3)", text: "This is my first peep")
  end

  scenario "I want to change oldest of peeps from oldest first" do
      click_button("Oldest First")

      expect(page).to have_selector("ul#peeps li:nth-child(1)", text: "This is my first peep" )
      expect(page).to have_selector("ul#peeps li:nth-child(3)", text: "This is my second peep")
    end

  scenario 'I want to be able to go back to original postion' do
      click_button("Oldest First")
      click_button("Newest First")

      expect(page).to have_selector("ul#peeps li:nth-child(1)", text: "This is my second peep")
      expect(page).to have_selector("ul#peeps li:nth-child(3)", text: "This is my first peep")
  end
end
