# at the top of the file, require the file path for each page classes
require_relative 'pages/checkout_item.rb'
require_relative 'pages/create_item.rb'
require_relative 'pages/item_show_page.rb'
require_relative 'pages/items.rb'
require_relative 'pages/checkout_item.rb'
require_relative 'pages/login_page.rb'
require_relative 'pages/logs_show_page.rb'
require_relative 'pages/logs.rb'
require_relative 'pages/navbar.rb'
require_relative 'pages/new_academy.rb'

module InventoryApp
# this is the superclass. This will contain sub classes that contain methods that navigate the pages.

    def checkout_item
      CheckoutItem.new
    end

    def create_item
      CreateItem.new
    end

    def item_show_page
      ItemShowPage.new
    end

    def items
      Item.new
    end

    def checkout_item
      CheckoutItem.new
    end

    def login_page
      Login.new
    end

    def logs_show_page
      LogsShowPage.new
    end

    def logs
      Logs.new
    end

    def navbar
      Navbar.new
    end

    def new_academy
      NewAcademy.new
    end

end
