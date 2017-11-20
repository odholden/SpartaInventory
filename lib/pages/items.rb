
require 'capybara/dsl'

class CheckoutItem
  include Capybara::DSL

  URL ||= 'http://development.local:3000/'
  ADD_NEW_ITEM_BUTTON ||= '//*[@id=“items”]/div/div/a'
  DESCRIPTION_LINK ||= '//*[@id=“items"]/div/div/table/tbody/tr/td[2]/a'
  DELETE_ITEM_LINK ||= '//*[@id="items"]/div/div/table/tbody/tr/td[5]/a’'

  def url
    visit(URL)
  end

  def add_new_item_button
    visit(ADD_NEW_ITEM_BUTTON)
  end

  def description_link
    find(DESCRIPTION_LINK)
  end

  def delete_item_link
    find(DELETE_ITEM_LINK)
  end
end
