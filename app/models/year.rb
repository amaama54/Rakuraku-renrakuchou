class Year < ApplicationRecord
  
  belongs_to :teacher, optional: true
end
