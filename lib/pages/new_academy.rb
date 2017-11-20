require 'capybara/dsl'

class NewAcademy
  include Capybara::DSL

  NAME_FIELD ||= '//*[@id=“academy_name"]'
  CREATE_ACADEMY_BUTTON ||= '//*[@id=“new_academy"]/div[2]/input'
  BACK_LINK ||= "/html/body/div[2]/div/div/a"

  def visit_new_academy_page
    visit('/academies/new')
  end

  def find_name_field
    find(:xpath, NAME_FIELD)
  end

  def fill_in_name_field
    name = find_name_field
    fill_in(name, with: 'Leeds')
  end

  def find_create_academy_button
    find(:xpath, CREATE_ACADEMY_BUTTON)
  end

  def click_create_academy_button
    find_create_academy_button.click
  end

  def find_back_link
    find(:xpath, BACK_LINK)
  end

  def click_back_link
    find_back_link.click
  end

end
