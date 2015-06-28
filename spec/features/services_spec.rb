require "rails_helper"

RSpec.feature "Services page", :js do
  background do
    visit '/services'
    expect(page).to have_css '#services_link.current'
  end

  scenario "user see page content" do
    expect(page).to have_content 'What we offer'
  end
end
