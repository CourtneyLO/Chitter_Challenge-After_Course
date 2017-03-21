require 'spec_helper'

feature "Log Out", type: :feature do

  scenario "I want to be able to log out of Chitter" do
    sign_up
    click_button("Log Out")

    expect(current_path).to eq("/session/new")
    expect(page).to have_content("Log In")
  end

  scenario "I want to be able to log out of Chitter and then log back i" do
    sign_up
    click_button("Log Out")
    log_in

    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome Dan")
  end

  scenario "I want to ensure that when someone logs out there is no current user" do
    sign_up
    click_button("Log Out")

    visit('/peep/new')
    expect(page).to have_content("Log In")
  end
end
