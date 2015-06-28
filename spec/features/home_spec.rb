require "rails_helper"

RSpec.feature "Home page", :js do
  background do
    clear_emails
    visit '/'
    expect(page).to have_css '#home_link.current'
  end

  scenario "user see menu links" do
    # Test main slider
    expect(page).to have_css '.cycle-pager-active'
    first('#slideshow_nav span:not(.cycle-pager-active)').click
    expect(page).to have_css '#slideshow .cycle-paused'

    # Test testimonials
    expect(page).to have_css '.cycle-slide-active'
    find('#slider_next').click
    expect(page).to have_css '#slider .cycle-paused'
    find('#slider_prev').click
    expect(page).to have_css '#slider .cycle-paused'

    # Test menu
    click_link 'Services'
    expect(page).to have_css '#services_link.current'

    # click_link 'Portfolio'
    click_link 'Portfolio'
    expect(page).to have_css '#portfolio_link.current'

    # click_link 'Contact'
    click_link 'Contact'
    expect(page).to have_css '#contact_link.current'

    # click_link 'Blog'
    click_link 'Blog'
    expect(page).to have_css '#news_link.current'
  end

  scenario 'User is able to subscribe to newsletter' do
    # Fill in empty email
    fill_in 'Type your email here', with: ''
    click_button 'Subscribe'
    expect(page).to have_no_content 'Thank you for your subscription'

    # Fill in email
    fill_in 'Type your email here', with: 'test@example.com'
    click_button 'Subscribe'
    expect(page).to have_content 'Thank you for your subscription'
    open_email('test@example.com')
    expect(current_email).to have_content 'You were successfully subscribed to our newsletter'

    # Can not subscribe twice
    fill_in 'Type your email here', with: 'test@example.com'
    click_button 'Subscribe'
    expect(page).to have_content 'Error: Email is already subscribed'

    # Can not subscribe with no email
    fill_in 'Type your email here', with: 'test'
    click_button 'Subscribe'
    expect(page).to have_content 'Error: Email is invalid'

    # Unsubscribe from email
    current_email.click_link 'unsubscribe here'
    expect(page).to have_content 'Your email was removed from our list. We are sorry to see you go, but you can always subscribe again.'
  end

  scenario 'User is able to visit social links' do
    # Visit facebook
    facebook_window = window_opened_by { click_link 'Facebook' }
    within_window facebook_window do
      expect(current_url).to eq 'https://www.facebook.com/codegyver'
    end

    # Visit twitter
    twitter_window = window_opened_by { click_link 'Twitter' }
    within_window twitter_window do
      expect(current_url).to eq 'https://twitter.com/codegyver'
    end

    # Test other links
    expect(page).to have_link 'zpiesla'
    expect(page).to have_link 'contact(at)codegyver.com'
    expect(page).to have_link 'Github'
  end
end
