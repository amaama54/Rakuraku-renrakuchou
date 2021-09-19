class Parent::ConnectionsController < ApplicationController

  def index
    @connections = Connection.where(teacher_id: current_parent.teachers.pluck('id')).order(created_at: :desc).page(params[:page]).per(8)
    #現在の時間を取得
    @current_time = Time.current
  end

  def show
    @connection = Connection.find(params[:id])
  end

end
