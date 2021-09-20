class Year < ApplicationRecord
  
  belongs_to :teacher, optional: true
  
  validates :title, presence: true
end
