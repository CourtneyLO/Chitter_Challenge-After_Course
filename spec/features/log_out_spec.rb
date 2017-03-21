require 'spec_helper'

feature "Log Out", type: :feature do

  scenario "I want to be able to log out of Chitter" do
    sign_up
    click_button("Log Out")

    expect(current_path).to eq("/session/new")
    expect(page).to have_content("Log In")
  end

  scenario "I want to be able to log out of Chitter and then log back in" do
    sign_up
    click_button("Log Out")
    log_in

    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome Dan")
  end
end
