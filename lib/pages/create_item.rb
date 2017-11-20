require 'capybara/dsl'

class CreateItem
  include Capybara::DSL

  URL = 'http://development.local:3000/'
  DESCRIPTION ||= '//*[@id=“item_description"]'
  SERIAL_FIELD ||= '//*[@id=“item_serial"]'
  ACADEMY_DROPDOWN ||= '//*[@id=“item_academy_id"]'
  SAVE_ITEM_BUTTON ||= '//*[@id=“new_item"]/div[4]/input'

  def visit_page
    visit(URL)
  end

  def description
    find(:xpath, DESCRIPTION)
  end

  def serial_field
    find(:xpath, SERIAL_FIELD)
  end

  def academy_dropdown
    find(:xpath, ACADEMY_DROPDOWN)
  end

  def save_item_button
    find(:xpath, SAVE_ITEM_BUTTON)
  end
end

x = CheckoutItem.new

x.visit_page
