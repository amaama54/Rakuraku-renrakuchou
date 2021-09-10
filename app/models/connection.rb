class Connection < ApplicationRecord
  
  belongs_to :teacher, optional: true
end
