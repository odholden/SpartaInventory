class Log < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :returner, :class_name => 'User' , :required => false

end
