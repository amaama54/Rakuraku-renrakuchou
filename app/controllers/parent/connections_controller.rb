class Parent::ConnectionsController < ApplicationController

  def index
    @connections = Connection.where(teacher_id: current_parent.teachers.pluck('id'))
  end

  def show
    @connection = Connection.find(params[:id])
  end

end
