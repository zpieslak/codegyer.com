require "rails_helper"

RSpec.feature "Contact page", :js do
  background do
    clear_emails
    visit '/contact'
    expect(page).to have_css '#contact_link.current'
  end

  scenario "user see page content" do
    # User see content
    expect(page).to have_content 'Contact Us'
    expect(page).to have_content 'Company Info'

    # Send with empty fields
    click_button 'Send'
    expect(all_emails).to be_empty

    # Send with name only
    fill_in 'Your Name', with: 'John Smith'
    click_button 'Send'
    expect(all_emails).to be_empty

    # Send with name and email only
    fill_in 'Your Email', with: 'test@example.com'
    click_button 'Send'
    expect(all_emails).to be_empty

    # Send with wrong email
    fill_in 'Your Email', with: 'wrong email'
    fill_in 'Your Message', with: 'My message'
    click_button 'Send'
    expect(all_emails).to be_empty

    # Send with all requried fields
    fill_in 'Your Email', with: 'test@example.com'
    click_button 'Send'
    expect(page).to have_content 'Thank you'
    expect(page).to have_content "We've received your message and will get back to you with a response shortly."

    # Test email
    open_email 'contact@codegyver.com'
    expect(current_email.header('From')).to eq 'test@example.com'
    expect(current_email).to have_content 'John Smith'
    expect(current_email).to have_content 'My message'
  end
end

