require 'capybara/dsl'

class Login
  include Capybara::DSL

  LOGIN_NAVBAR_LINK ||= "/html/body/nav/ul[2]/li/a"
  EMAIL_FIELD ||= "/html/body/div[2]/div/div/form/div[1]/input"
  PASSWORD_FIELD ||= "/html/body/div[2]/div/div/form/div[2]/input"
  SUBMIT_BUTTON ||= "/html/body/div[2]/div/div/form/div[3]/input"

  def visit_login_page
    visit('/login')
  end

  def find_login_navbar_link
    find(:xpath, LOGIN_NAVBAR_LINK)
  end

  def click_login_navbar_link
    find_login_navbar_link.click
  end

  def find_email_field
    find(:xpath, EMAIL_FIELD)
  end

  def fill_in_email_field
    email = find_email_field
    fill_in(email, with: 'test@spartaglobal.com')
  end

  def find_password_field
    find(:xpath, PASSWORD_FIELD)
  end

  def fill_in_password_field
    password = find_password_field
    fill_in(password, with: 'spartatest')
  end

  def find_submit_button
    find(:xpath, SUBMIT_BUTTON)
  end

  def click_submit_button
    click.find_submit_button
  end

end
