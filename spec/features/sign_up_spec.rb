require 'spec_helper'

feature "Sign Up", type: :feature do

  scenario "I want to be able to sign in to chitter" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome Dan")
  end

  scenario "I should not be able to sign up if password and password confirmation do not match" do
    expect { fail_sign_up_password }.not_to change(User, :count)
    expect(current_path).to eq("/user/new")
    expect(page).to have_content("Sign Up")
  end

  scenario "I should not be allowed to log in with an existing email" do
    sign_up
    expect { fail_sign_up_email }.not_to change(User, :count)
    expect(current_path).to eq("/user/new")
    expect(page).to have_content("Sign Up")
  end

  scenario "I should not be able to sign_up with an invalid email address" do
    expect{ invalid_email }.to_not change(User, :count)
    expect(current_path).to eq("/user/new")
    expect(page).to have_content("Sign Up")
  end

  scenario "I should be able to access the log in page from sign up page" do
    visit('/user/new')

    click_link('Log In')

    expect(current_path).to eq('/session/new')
    expect(page).to have_content("Log In") 
  end
end
