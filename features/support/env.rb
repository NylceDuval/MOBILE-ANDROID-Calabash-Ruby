require 'report_builder'

@projects = JSON.parse(File.read("#{Dir.pwd}/dependencies.json"))

def require_platform
  if ENV['PLATFORM'] == 'ios'
    require 'calabash-cucumber/cucumber'
  elsif ENV['PLATFORM'] == 'android'
    require 'calabash-android/cucumber'
  end
end

def require_support
  Dir['../features/support/*.rb'].each { |file| require file }
end

def require_dependencies
  @projects['dependencies'].each do |project|
    Dir["../#{project}/features/step_definitions/**/*.rb"].each { |file| require file }
  end
end

require_platform
require_support
require_dependencies
