require 'capybara/dsl'

class LogsShowPage
  include Capybara::DSL

  BACK_TO_LOGS_BUTTON ||= "/html/body/div[2]/div/div/a"

  def visit_page
    visit('/log/7')
  end

  def find_back_to_logs_button
    find(:xpath, BACK_TO_LOGS_BUTTON)
  end

  def click_back_to_Logs_button
    find_back_to_logs_button.click
  end

end
