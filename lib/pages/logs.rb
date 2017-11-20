require 'capybara/dsl'

class Logs
  include Capybara::DSL

  CHECKOUT_ITEM_BUTTON ||= "html/body/div[2]/div/div/a"
  CHECK_IN_LINK ||= "/html/body/div[2]/div/div/table/tbody/tr/td[7]/a"
  DELETE_LINK ||= "html/body/div[2]/div/div/table/tbody/tr/td[8]/a"

  def visit_logs_page
    visit('/logs')
  end

  def find_checkout_item_button
    find(:xpath, CHECKOUT_ITEM_BUTTON)
  end

  def click_checkout_item_button
    find_checkout_navbar_link.click
  end

  def find_check_in_link
    find(:xpath, CHECK_IN_LINK)
  end

  def click_check_in_link
    find_check_in_link.click
  end

  def find_delete_link
    find(:xpath, DELETE_LINK)
  end

  def click_delete_link
    find_delete_link.click
  end

end
