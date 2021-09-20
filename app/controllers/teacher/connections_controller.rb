class Teacher::ConnectionsController < ApplicationController
  before_action :authenticate_teacher!,except: [:top]
  
  def index
    @teacher = Teacher.find(current_teacher.id)
    @connections = @teacher.connections.order(created_at: :desc).page(params[:page]).per(8)
    
    @connection = Connection.new
  end
  
  def create
    @connection = Connection.new(connection_params)
    @connection.teacher_id = current_teacher.id
    if @connection.save
      redirect_to teacher_connections_path(current_teacher)
    else
      @teacher = Teacher.find(current_teacher.id)
      @connections = @teacher.connections.order(created_at: :desc).page(params[:page]).per(8)
      render :index
    end
  end
  
  def show
    @connection = Connection.find(params[:id])
  end
  
  def edit
    @connection = Connection.find(params[:id])
  end
  
  def update
    connection = Connection.find(params[:id])
    connection.update(connection_params)
    redirect_to teacher_connection_path(connection)
  end
  
  def destroy
    connection = Connection.find(params[:id])
    connection.destroy
    redirect_to teacher_connections_path(current_teacher)
  end
  
   private
  def connection_params
    params.require(:connection).permit(:title, :body, :teacher_id)
  end

end
