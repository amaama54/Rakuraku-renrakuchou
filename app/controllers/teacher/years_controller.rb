class Teacher::YearsController < ApplicationController
  before_action :authenticate_teacher!,except: [:top]
  
  def index
    @teacher = Teacher.find(current_teacher.id)
    @years = @teacher.years
    
    @year = Year.new
  end
  
  def create
    @year = Year.new(year_params)
    @year.teacher_id = current_teacher.id
    if @year.save
      flash[:notice] = "新規予定を作成しました！"
      redirect_to teacher_years_path
    else
      @teacher = Teacher.find(current_teacher.id)
      @years = @teacher.years
      render :index
    end
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
  
