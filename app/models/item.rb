class Item < ApplicationRecord

  validates :description, :serial, presence: true
	
  has_many :logs
  has_one :current, -> { where return_date: nil }, class_name: "Log"
  belongs_to :academy


  filterrific(
    available_filters: [
        :sorted_by,
        :with_academy_id
    ])
end
