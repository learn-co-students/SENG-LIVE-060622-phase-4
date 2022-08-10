class ProductionsController < ApplicationController
# rescue_from ActiveRecord::RecordInvalid, with: :invalid_error

    def index
        render json: Production.all, status: :ok
    end

    def show
        production = Production.find(params[:id])
        render json: production, status: :ok
        # rescue ActiveRecord::RecordNotFound => error
        #     render json: {message: error.message}
    end

    def create
        production = Production.create!(production_params)
        render json: production, status: :created

        # .valid? : doesn't persist to the db but it will check our validations and generate the errors feedbck if it fails
        # if production.valid? # boolean
        #     render json: production, status: :created
        # else 
        #     render json: { errors: production.errors.full_messages }, status: :unprocessable_entity
        # end

        # exception error handling:
    # rescue ActiveRecord::RecordInvalid => invalid
    #     render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def update
        production = Production.find(params[:id])
        production.update!(production_params)
        render json: production, status: :accepted

        # raised when .find fails 
        # rescue ActiveRecord::RecordNotFound => error
        #     render json: {message: error.message}

        # raised when .update! fails
        # rescue ActiveRecord::RecordInvalid => invalid
        #     render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def destroy
        production = Production.find(params[:id])
        production.destroy
        head :no_content
        # rescue ActiveRecord::RecordNotFound => error
        #     render json: {message: error.message}
    end

    private

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end

    # def invalid_error(error)
    #     render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    # end

end
