class StudentsController < ApplicationController

  def index
    render json: Student.all
  end

  def show
    student = student_find
    render json: student, include: [:instructor]
  end

  def delete
    student = student_find
    student.destroy
  end

  def create
    student.create(student_params)
  end

  def update
    student = student_find
    student.update(student_params)
  end

  private

  def student_find
    Student.find_by(id: params[:id])
  end

  def student_params
    params.permit(:name, :age, :major, :instructor)
  end
end
