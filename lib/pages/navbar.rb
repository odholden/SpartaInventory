require 'capybara/dsl'

class Navbar
  include Capybara::DSL

  URL ||= "http://development.local:3000/"
  SPARTA_GLOBAL_LINK ||= "/html/body/nav/div/a"
  ITEMS_NAVBAR_LINK ||= "/html/body/nav/ul[1]/li[1]/a"
  LOGS_NAVBAR_LINK ||= "/html/body/nav/ul[1]/li[2]/a"
  CHECKOUT_NAVBAR_LINK ||= "/html/body/nav/ul[1]/li[3]/a"
  NEW_ACADEMY_LINK ||= "/html/body/nav/ul[2]/li[1]/a"
  ACCOUNT_NAVBAR_LINK ||= "/html/body/nav/ul[2]/li[2]/a"
  LOGOUT_NAVBAR_LINK ||= "/html/body/nav/ul[2]/li[3]/a"

  def visit_root_page
    visit(URL)
  end

  def find_sparta_global_link
    find(:xpath, SPARTA_GLOBAL_LINK)
  end

  def click_sparta_global_link
    find_sparta_global_link.click
  end

  def find_items_link
    find(:xpath, ITEMS_NAVBAR_LINK)
  end

  def click_items_link
    find_items_link.click
  end

  def find_logs_navbar_link
    find(:xpath, LOGS_NAVBAR_LINK)
  end

  def click_logs_link
    find_logs_navbar_link.click
  end

  def find_checkout_navbar_link
    find(:xpath, CHECKOUT_NAVBAR_LINK)
  end

  def click_checkout_link
    find_checkout_navbar_link.click
  end

  def find_new_academy_link
    find(:xpath, NEW_ACADEMY_LINK)
  end

  def click_new_academy_link
    find_new_academy_link.click
  end

  def find_account_navbar_link
    find(:xpath, ACCOUNT_NAVBAR_LINK)
  end

  def click_account_navbar_link
    find_account_navbar_link.click
  end

  def find_logout_navbar_link
    find(:xpath, LOGOUT_NAVBAR_LINK)
  end

  def click_logout_navbar_link
    find_logout_navbar_link.click
  end

end
