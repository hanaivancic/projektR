module Api
  class TeachersController < ApplicationController
    before_action :load_teacher, except: [:index, :create]

    def index
      render json: TeacherSerializer.render_as_json(Teacher.all.order(name: :asc), root: 'teachers')
    end

    def show
      render json: TeacherSerializer.render_as_json(@teacher, root: 'teacher')
    end

    def create
      teacher = Teacher.new(teacher_params)
      if teacher.save
        render json: TeacherSerializer.render(teacher, root: 'teacher'), status: :created
      else
        render json: { errors: teacher.errors }, status: :bad_request
      end
    end

    def update
      if @teacher.update(teacher_params)
        render json: TeacherSerializer.render_as_json(@teacher, root: 'teacher')
      else
        render json: { errors: @teacher.errors }, status: :bad_request
      end
    end

    def destroy
      @teacher.destroy
      head :no_content
    end

    private

    def teacher_params
      params.require(:teacher).permit(:id, :name, :lastName, :created_at, :updated_at, :school_id, classrooms: [])
    end

    def load_teacher
      @teacher = Teacher.find(params[:id])
    end
  end
end