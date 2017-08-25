class App

  # Screen agnostic methods here

  # Takes screenshot
  def report_screenshot(error)
    $browser.screenshot.save "#{error}. Scenario: #{$scenario_name}. Screen: #{self.class}.png"
  end

  def wait
    sleep 2
  end

end
