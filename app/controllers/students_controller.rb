class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    set_student
    # byebug
    if @student.active
      @status = "This student is currently active."
    else
      @status = "This student is currently inactive."
    end
  end

  def update
    set_student
    # @student.update(active: !@student.active)
    # # byebug
    # redirect_to student_path(@student)
  end

  def activate
    set_student
    @student.update(active: !@student.active)
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
