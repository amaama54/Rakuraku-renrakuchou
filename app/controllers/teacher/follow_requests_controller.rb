class Teacher::FollowRequestsController < ApplicationController
  before_action :authenticate_teacher!,except: [:top]
  
  def index
    @requests = current_teacher.follow_requests.all.page(params[:page]).per(8)
  end
  
  def allow
    request = FollowRequest.find(params[:id])
    parent = Parent.find_by(id:request.parent_id)
    follow = current_teacher.parent_follows.new(teacher_id:current_teacher.id, parent_id: parent.id)
    follow.save
    request.destroy
    flash[:notice] = "申請を承認しました"
    redirect_to teacher_teacher_follow_requests_path(current_teacher)
  end
  
  def destroy
    request = FollowRequest.find(params[:id])
    request.destroy
    flash[:notice] = "申請を拒否しました"
    redirect_to teacher_teacher_follow_requests_path(current_teacher)
  end
end
