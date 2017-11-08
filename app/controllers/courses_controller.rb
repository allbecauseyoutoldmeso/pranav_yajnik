class CoursesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:what, :when, :where, :freetext)
  end
end
