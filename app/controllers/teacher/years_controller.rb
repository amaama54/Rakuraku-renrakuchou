class Teacher::YearsController < ApplicationController
  
  def index
    @years = Year.all
    
    @year = Year.new
  end
  
  def create
    @year = Year.new(year_params)
    @year.teacher_id = current_teacher.id
    @year.save
    redirect_to teacher_years_path
  end
  
  def destroy
    @year = Year.find(params[:id])
    @year.destroy
    redirect_to teacher_years_path
  end
  
  def edit
    @year = Year.find(params[:id])
  end
  
  def update
    @year = Year.find(params[:id])
    @year.update(year_params)
    redirect_to teacher_years_path
  end
    
  
  
  private
  def year_params
    params.require(:year).permit(:title, :start_time)
  end
end
  
