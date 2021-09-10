class Teacher::ConnectionsController < ApplicationController
  
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
    redirect_to teacher_teacher_path(current_teacher)
  end
  
   private
  def connection_params
    params.require(:connection).permit(:title, :body)
  end

end
