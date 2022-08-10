class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_error
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  # when validations fail: .create!, .update!
  def invalid_error(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
  
  # when .find can't find a record 
  def record_not_found(error)
    render json: {message: error.message}
  end
end
