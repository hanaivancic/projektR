module Api
  class QuestionsController < ApplicationController
    before_action :load_question, except: [:index, :create]

    def index
      render json: QuestionSerializer.render_as_json(Question.all, root: 'questions')
    end

    def show
      render json: QuestionSerializer.render_as_json(@question, root: 'question')
    end

    def create
      question = Question.new(question_params)
      if question.save
        render json: QuestionSerializer.render(question, root: 'question'), status: :created
      else
        render json: { errors: question.errors }, status: :bad_request
      end
    end

    def update
      if @question.update(question_params)
        render json: QuestionSerializer.render_as_json(@question, root: 'question')
      else
        render json: { errors: @question.errors }, status: :bad_request
      end
    end

    def destroy
      @question.destroy
      head :no_content
    end

    private

    def question_params
      params.require(:question).permit(:id, :question, :answer, :created_at, :updated_at, :deck_id)
    end

    def load_question
      @question = Question.find(params[:id])
    end
  end
end