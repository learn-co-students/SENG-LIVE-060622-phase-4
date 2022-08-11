class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

private 

  def invalid_record(invalid)
    # .create, .update => have an instance we are working with
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def record_not_found(error)
    # .find 
    render json: {message: error.message}, status: :not_found
  end

end


# invalid = ActiveRecord::RecordInvalid.new