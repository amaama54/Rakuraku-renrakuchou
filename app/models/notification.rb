class Notification < ApplicationRecord
  
  belongs_to :connection, optional: true
  
  belongs_to :visitor, class_name: "teacher", foreign_key: "visitor_id", optional: true
  belongs_to :visited, class_name: "parent", foreign_key: "visited_id", optional: true
end
