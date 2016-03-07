
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :js_errors => false)
end
Capybara.run_server = false
driver = :poltergeist
Capybara.default_driver = driver
Capybara.javascript_driver = driver
Capybara.current_driver = driver
Capybara.default_max_wait_time = 3
include Capybara::DSL

visit 'http://www.city-data.com/city/St.-George-Utah.html'
first = find_all('#tabgm19 .hgraph tr').first.find_all('td')[1].text.to_f
second = page.text.match(/AQI\)[^.]*\ (\d+\.?\d*)/)[1].to_f

puts first
puts second


