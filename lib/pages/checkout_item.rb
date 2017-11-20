require 'capybara/dsl'
# require 'cucumber'

class CheckoutItem
  include Capybara::DSL

  URL ||= 'http://localhost:3000/'
  CHOOSE_ITEM ||= '/html/body/div[2]/div/div/form/div[1]/select'
  BORROWER ||= '/html/body/div[2]/div/div/form/div[2]/select'
  DUE_DATE ||= '/html/body/div[2]/div/div/form/div[3]/input'
  CHECKOUT ||= '/html/body/div[2]/div/div/form/div[4]/input'

  def visit_page
    visit(URL)
  end

  def choose_item
    find(:xpath, CHOOSE_ITEM)
  end

  def burrower
    find(:xpath, BURROWER)
  end

  def due_date
    find(:xpath, DUE_DATE)
  end

  def checkout
    find(:xpath, CHECKOUT)
  end
end
