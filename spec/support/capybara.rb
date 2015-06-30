require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara/email/rspec'

Capybara.server_host = '127.0.0.1'
Capybara.server_port = 4000
Capybara.javascript_driver = :poltergeist
options = { timeout: 180, phantomjs_logger: StringIO.new, logger: nil, phantomjs_options: ['--ignore-ssl-errors=yes', '--ssl-protocol=TLSv1'] }

Capybara.register_driver(:poltergeist) do |app|
  Capybara::Poltergeist::Driver.new app, options
end
