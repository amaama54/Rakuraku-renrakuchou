class Parent::FollowRequestsController < ApplicationController
  
  def create
    teacher = Teacher.find(params[:teacher_id])
    request = current_parent.follow_requests.new(teacher_id: teacher.id, parent_id: current_parent.id)
    request.save
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    teacher = Teacher.find(params[:teacher_id])
    request = current_parent.follow_requests.find_by(teacher_id: teacher.id, parent_id: current_parent.id)
    request.destroy
    redirect_back(fallback_location: root_url)
  end
end
