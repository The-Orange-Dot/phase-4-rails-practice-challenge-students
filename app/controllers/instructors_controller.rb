class InstructorsController < ApplicationController

  def index
    render json: Instructor.all
  end

  def show
    instructor = instructor_find
    render json: instructor, include: [:students]
  end

  def delete
    instructor = instructor_find
    instructor.destroy
  end

  def create
    instructor.create(instructor_params)
  end

  def update
    instructor = instructor_find
    instructor.update(instructor_params)
  end

  private

  def instructor_find
    Instructor.find_by(id: params[:id])
  end

  def instructor_params
    params.permit(:name, :students)
  end
end
