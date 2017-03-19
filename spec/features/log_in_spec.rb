require 'spec_helper'

feature "Log In", type: :feature do
  scenario "I want to be able to log into Chitter" do
    log_in
    expect(current_path).to eq("/")
    expect(page).to have_content("Hello Dan")
  end
end
