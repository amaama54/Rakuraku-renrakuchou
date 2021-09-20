class Parent::KeepsController < ApplicationController
  before_action :authenticate_parent!,except: [:top]
  
  def index
    @connections = Connection.where(id: current_parent.connections).order(created_at: :desc).page(params[:page]).per(8)
    #現在の時間を取得
    @current_time = Time.current
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
