require 'spec_helper'

feature "Sign Up", type: :feature do

  scenario "I want to be able to sign in to chitter" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome Dan")
  end
end
