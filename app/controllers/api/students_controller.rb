module Api
  class StudentsController < ApplicationController
    before_action :load_student, except: [:index, :create]

    def index
      render json: StudentSerializer.render_as_json(Student.all.order(name: :asc), root: 'student')
    end

    def show
      render json: StudentSerializer.render_as_json(@student, root: 'student')
    end

    def create
      student = Student.new(student_params)
      if student.save
        render json: StudentSerializer.render(student, root: 'student'), status: :created
      else
        render json: { errors: student.errors }, status: :bad_request
      end
    end

    def update
      if @student.update(student_params)
        render json: StudentSerializer.render_as_json(@student, root: 'student')
      else
        render json: { errors: @student.errors }, status: :bad_request
      end
    end

    def destroy
      @student.destroy
      head :no_content
    end

    private

    def student_params
      params.require(:student).permit(:id, :name, :lastName, :coinNumber, :created_at, :updated_at, :classroom_id)
    end

    def load_student
      @student = Student.find(params[:id])
    end
  end
end