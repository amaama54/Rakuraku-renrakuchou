class Parent::YearsController < ApplicationController
  before_action :authenticate_parent!,except: [:top]
  
  def index
    @years = Year.where(teacher_id: current_parent.teachers.pluck('id'))
  end
end
