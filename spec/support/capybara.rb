Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--window-size=1240,1400')
  options.add_argument('--no-sandbox')
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 90 # instead of the default 60
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, http_client: client)
end