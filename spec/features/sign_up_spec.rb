require 'spec_helper'

feature "Sign Up", type: :feature do

  scenario "I want to be able to sign in to chitter" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome Dan")
  end

  scenario "I should not be able to sign up if password and password confirmation do not match" do
    expect { fail_sign_up }.not_to change(User, :count)
    expect(current_path).to eq("/user/new")
    expect(page).to have_content("Sign Up")
  end
end
