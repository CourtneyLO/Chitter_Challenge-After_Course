require 'spec_helper'

feature "Changing Order", type: :feature do

  scenario 'I want to be able to see the lastest peep first' do
    sign_up
    add_peep
    visit ('/')

      expect(page).to have_selector("ul#peeps li:nth-child(1)", text: "This is my second peep")
      expect(page).to have_selector("ul#peeps li:nth-child(2)", text: "This is my first peep")
  end
end
