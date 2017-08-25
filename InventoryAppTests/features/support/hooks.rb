require 'watir'

# Deletes all files from screenshots folder before beginning tests
# Dir['**/screenshots/*'].each { |file| File.delete(file)}

Before do |scenario|
  $browser = Watir::Browser.new :chrome
  @screen ||= Screens.new
  $scenario_name = scenario.name
end

After do |scenario|
  # Nothing
end

# At the end of a complete run of tests, this will send an email with all
# screenshots intended for review.

at_exit do
  # $browser.close
  
  # SendMail.send_email
end
