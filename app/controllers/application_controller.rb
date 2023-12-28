class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render json: { errors: 'Record not found' }, status: :not_found
  end

  def current_user
    @current_user ||= User.find_by(token: request.headers[:Authorization])
  end

  def authenticate
    return unless request.headers[:Authorization].nil? || current_user.nil?

    render json: { errors: { token: ['is invalid'] } }, status: :unauthorized
  end
end
