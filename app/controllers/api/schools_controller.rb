module Api
  class SchoolsController < ApplicationController
    before_action :load_school, except: [:index, :create]

    def index
      render json: SchoolSerializer.render_as_json(School.all.order(name: :asc), root: 'schools')
    end

    def show
      render json: SchoolSerializer.render_as_json(@school, root: 'school')
    end

    def create
      school = School.new(school_params)
      if school.save
        render json: SchoolSerializer.render(school, root: 'school'), status: :created
      else
        render json: { errors: school.errors }, status: :bad_request
      end
    end

    def update
      if @school.update(school_params)
        render json: SchoolSerializer.render_as_json(@school, root: 'school')
      else
        render json: { errors: @school.errors }, status: :bad_request
      end
    end

    def destroy
      @school.destroy
      head :no_content
    end

    private

    def school_params
      params.require(:school).permit(:id, :name, :created_at, :updated_at)
    end

    def load_school
      @school = School.find(params[:id])
    end
  end
end