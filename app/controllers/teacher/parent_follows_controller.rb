class Teacher::ParentFollowsController < ApplicationController
  before_action :authenticate_teacher!,except: [:top]
  
  def index
    @followers = current_teacher.parent_follows.all.page(params[:page]).per(8)
  end
  
  def destroy
    follow = ParentFollow.find(params[:id])
    follow.destroy
    redirect_to teacher_teacher_parent_follows_path(current_teacher)
  end
end
