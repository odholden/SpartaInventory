require 'watir'
require 'pry'
require 'dotenv'
require 'watir-scroll'

Given(/^I am on the Sparta Inventory login page$/) do
  $browser.goto "http://inventory.spartaglobal.academy/login"
  @screen.login.await == "Inventory"
end

Given(/^I fill in the required fields to login$/) do
  @screen.login.enter_text_in_field("test@spartaglobal.com", "email")
  @screen.login.wait
  @screen.login.enter_text_in_field("test123", "password")
end

When(/^I click on login$/) do
  @screen.login.select_login_button
end

Then(/^I should be logged in and redirected to the logs page$/) do
  @screen.login.wait
  # $browser.wait_until(5) { $browser.text_field(:class => "navbar-brand") }
  @screen.logs.verify_something("navbar-brand")
  $browser.scroll.to :bottom
  @screen.login.wait
  $browser.button(:class => "btn").click
end
