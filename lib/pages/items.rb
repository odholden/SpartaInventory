
require 'capybara/dsl'

class CheckoutItem
  include Capybara::DSL

  URL ||= 'http://localhost:3000/'
  ADD_NEW_ITEM_BUTTON ||= '//*[@id=“items”]/div/div/a'
  DESCRIPTION_LINK ||= '//*[@id=“items"]/div/div/table/tbody/tr/td[2]/a'
  DELETE_ITEM_LINK ||= '//*[@id="items"]/div/div/table/tbody/tr/td[5]/a’'

  def url
    visit(URL)
  end

  def add_new_item_button
    find(:xpath, ADD_NEW_ITEM_BUTTON)
  end

  def description_link
    find(:xpath, DESCRIPTION_LINK)
  end

  def delete_item_link
    find(:xpath, DELETE_ITEM_LINK)
  end
end
