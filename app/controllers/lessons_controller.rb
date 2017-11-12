class LessonsController < ApplicationController

  def index
    @lessons = Lesson.sorted_by_time
  end

  def new
    authenticate_admin!
    @lesson = Lesson.new
  end

  def create
    authenticate_admin!
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to lessons_path
    else
      render 'new'
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    render 'new'
  end

  def update
    Lesson.find(params[:id]).update(lesson_params)
    redirect_to lessons_path
  end

  def destroy
    authenticate_admin!
    lesson = Lesson.find(params[:id])
    lesson.destroy
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:what, :day, :time, :where, :freetext)
  end
end
