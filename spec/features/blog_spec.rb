require "rails_helper"

RSpec.feature "Blog page", :js do
  background do
    visit '/posts'
    expect(page).to have_css '#news_link.current'
  end

  scenario "user see page content" do
    expect(page).to have_content 'There are no posts currently.'
  end
end
