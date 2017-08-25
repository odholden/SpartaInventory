require_relative '../app'
require 'watir'

class Logs < App

  def await

  end

  def logs_screen_visible?
    # Checks if the logs screen is visible
  end

  def select_a_button
    # Selects a button
  end

  ###Verify###

  def verify_something(field)
    $browser.text_field(:class => "#{field}").exists?
  end

  private

    def trait

    end

end
