require 'rails_helper'

RSpec.feature 'Portfolio page', :js do
  given!(:project) { create :project, :randkowa }

  background do
    visit '/projects'
    expect(page).to have_css '#portfolio_link.current'
  end

  scenario 'user see page content' do
    # See content
    expect(page).to have_content 'Projects we made'
    expect(page).to have_content project.description
    expect(find('.image img')['src']).to match 'randkowa-logo'

    # Test project view
    click_link 'Randkowa'
    expect(page).to have_css 'h1', text: 'Randkowa'
    expect(current_path).to eq '/projects/randkowa'
    expect(page).to have_content project.content
    expect(page).to have_content project.short_content
    expect(page).to have_content project.features
    expect(page).to have_css '.images .gallery img', count: 6

    # Test gallery
    find('.gallery', match: :first).click
    expect(page).to have_css '#cboxContent'
    find('#cboxClose').click
    expect(page).to have_css '#cboxContent'
  end
end
