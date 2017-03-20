require 'spec_helper'

feature "Log In", type: :feature do
  scenario "I want to be able to log into Chitter" do
    sign_up
    visit('/session/new')
    expect(status_code).to eq(200)

    log_in
    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome Dan")
  end
end
