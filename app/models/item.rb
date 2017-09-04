class Item < ApplicationRecord
  validates :description, presence: true
  has_many :logs
  has_one :current, -> { where return_date: nil }, class_name: "Log"

  attr_accessor :borrower, :lender
  
end
