module Api
  class StatisticsController < ApplicationController
    before_action :load_statistic, except: [:index, :create]

    def index
      render json: StatisticSerializer.render_as_json(Statistic.all, root: 'statistic')
    end

    def show
      render json: StatisticSerializer.render_as_json(@statistic, root: 'statistic')
    end

    def create
      statistic = Statistic.new(statistic_params)
      if statistic.save
        render json: StatisticSerializer.render(statistic, root: 'statistic'), status: :created
      else
        render json: { errors: statistic.errors }, status: :bad_request
      end
    end

    def update
      if @statistic.update(statistic_params)
        render json: StatisticSerializer.render_as_json(@statistic, root: 'statistic')
      else
        render json: { errors: @statistic.errors }, status: :bad_request
      end
    end

    def destroy
      @statistic.destroy
      head :no_content
    end

    private

    def statistic_params
      params.require(:statistic).permit(:id, :questionNumber, :correctNumber, :halfNumber, :incorrectNumber,:created_at, :updated_at, :student_id)
    end

    def load_statistic
      @statistic = Statistic.find(params[:id])
    end
  end
end