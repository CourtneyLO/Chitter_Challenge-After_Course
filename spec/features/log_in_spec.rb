require 'spec_helper'

feature "Log In", type: :feature do

  before do
    visit('/session/new')
  end

  scenario "I want to be able to log into Chitter" do
    sign_up
    expect(status_code).to eq(200)

    log_in
    expect(current_path).to eq("/")
    expect(page).to have_content("Dan")
  end

  scenario "I want to be able to access the signed up page from log in page" do
    click_link("Sign Up")

    expect(current_path).to eq('/user/new')
    expect(page).to have_content('Sign Up')
  end
end
