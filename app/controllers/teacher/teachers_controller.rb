class Teacher::TeachersController < ApplicationController
  
  def show
    @teacher = Teacher.find(params[:id])
    @connections = @teacher.connections.order(created_at: :desc).page(params[:page]).per(8)
    
    @connection = Connection.new
  end
  
  def create
    @connection = Connection.new(connection_params)
    @connection.teacher_id = current_teacher.id
    @connection.save
    redirect_to teacher_teacher_path(current_teacher)
  end
  
  private
  def connection_params
    params.require(:connection).permit(:title, :body, :teacher_id)
  end
end
