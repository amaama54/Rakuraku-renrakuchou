class Keep < ApplicationRecord
  
  belongs_to :parent
  belongs_to :connection
end
