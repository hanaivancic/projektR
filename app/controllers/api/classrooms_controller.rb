module Api
  class ClassroomsController < ApplicationController
    before_action :load_classroom, except: [:index, :create]

    def index
      render json: ClassroomSerializer.render_as_json(Classroom.all, root: 'classroom')
    end

    def show
      render json: ClassroomSerializer.render_as_json(@classroom, root: 'classroom')
    end

    def create
      classroom = Classroom.new(classroom_params)
      if classroom.save
        render json: ClassroomSerializer.render(classroom, root: 'classroom'), status: :created
      else
        render json: { errors: classroom.errors }, status: :bad_request
      end
    end

    def update
      if @classroom.update(classroom_params)
        render json: ClassroomSerializer.render_as_json(@classroom, root: 'classroom')
      else
        render json: { errors: @classroom.errors }, status: :bad_request
      end
    end

    def destroy
      @classroom.destroy
      head :no_content
    end

    private

    def classroom_params
      params.require(:classroom).permit(:id, :name, :created_at, :updated_at, :school_id, teachers: [])
    end

    def load_school
      @school = School.find(params[:id])
    end
  end
end