require_relative '../app'
require 'watir'

class Login < App

  def await
    $browser.title
  end

  def login_screen_visible?
    # Checks if the login screen is visible
  end

  def select_login_button
    b = $browser.button(:value, "submit")
    b.click
  end

  def enter_text_in_field(text, txt_field) # ephemeral
    $browser.text_field(:name => "#{txt_field}").set "#{text}"
  end

  ###Verify###

  def verify_login_username_field_present
    # Verifies that login field 'username' is present
  end

  def verify_login_passsword_field_present
    # Verifies that login field 'password' is present
  end

  private

    def trait

    end

end
