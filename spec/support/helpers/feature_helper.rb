module FeatureHelper
  # Displays screenshoot from phantomjs, works only with X-server
  def save_and_open_screen
    file = 'tmp/capybara/screen.jpg'
    page.save_screenshot file, full: true
    system "xdg-open #{file}"
  end
end
