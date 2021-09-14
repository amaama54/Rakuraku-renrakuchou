class Teacher::ParentFollowsController < ApplicationController
  
  def index
    @followers = current_teacher.parent_follows.all
  end
  
  def destroy
    follow = ParentFollow.find(params[:id])
    follow.destroy
    redirect_to teacher_teacher_parent_follows_path(current_teacher)
  end
end
