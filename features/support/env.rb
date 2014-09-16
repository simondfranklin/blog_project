require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require 'pry'
require 'headless'

Capybara.default_driver = :selenium
Capybara.app_host = "http://www.google.co.uk"
Capybara.register_driver :selenium do |app|
	Capybara::Selenium::Driver.new app, browser: :chrome
end

if ENV['HEADLESS'] == 'true'
	display = 100 + Random.rand(900)
	headless = Headless.new(display: display, destroy_at_exit: true)
	headless.start
end
	        
World(Capybara::DSL)
