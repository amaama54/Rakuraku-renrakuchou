class Parent::ConnectionsController < ApplicationController
  
  def index
    @connections = Connection.where(teacher_id: [*current_parent.parent_follow_ids])
  end
  
  def show
  end
  
end
