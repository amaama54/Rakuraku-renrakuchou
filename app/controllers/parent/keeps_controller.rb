class Parent::KeepsController < ApplicationController
  
  def index
    @connections = Connection.where(id: current_parent.connections)
  end
  
  def create
    @connection = Connection.find(params[:connection_id])
    keep = current_parent.keeps.new(connection_id: @connection.id)
    keep.save
  end
  
  def destroy
    @connection = Connection.find(params[:connection_id])
    keep = current_parent.keeps.find_by(connection_id: @connection.id)
    keep.destroy
  end
end
