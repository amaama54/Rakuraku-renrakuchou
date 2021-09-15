class Parent::YearsController < ApplicationController
  
  def index
    @years = Year.where(teacher_id: current_parent.teachers.pluck('id'))
  end
end
