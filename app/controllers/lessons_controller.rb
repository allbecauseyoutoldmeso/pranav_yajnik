class LessonsController < ApplicationController

  before_action :authenticate_admin!, except: [:index]

  def index
    get_photo_url('lessons')
    @lessons = Lesson.sorted_by_time
  end

  def new
    @lesson = Lesson.new
  end

  def create
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
    lesson = Lesson.find(params[:id])
    lesson.destroy
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:what, :day, :start_time, :end_time, :where, :freetext, :start_date, :end_date)
  end
end
