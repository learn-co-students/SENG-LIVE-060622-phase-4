class ProductionsController < ApplicationController


# Responsible for showing all records of a resource
# GET '/productions'
    def index
        render json: Production.all, status: :ok
    end

# Responsible for returning a single production
# show action
# GET '/productions/:id' << dynamic route, :id is going to change to the value of the id of the resource we are looking
# params: existing empty hash that is accessible only from within our controller {}
#2 ways to add value to the params: 1. incoming data from a form 2. dynamic routes

def show
    # how do i access the id params[:id]
    production = Production.find(params[:id]) # find will return exception when the record doesn't exist
    render json: production, status: :ok
    rescue ActiveRecord::RecordNotFound => error
        render json: { message: error.message }

    # production = Production.find_by_id(params[:id]) # find_by return nil if the record doesnt exit, handle this using condition

    # if production
    #     render json: production, status: :ok
    # else
    #     render json: {message: "This production does not exist"}
    # end
end

# create a production
# POST '/productions'

def create

    # how am I receiving the data
    # how do I use that data to create a new production

    # rails doesn't like or permit mass assignment
    production = Production.create(production_params)
    render json: production, status: :created
end

# Update an existing production
# what HTTP verb is needed: PATCH
# What is the URL going to look like? '/productions/:id'

# PATCH '/productions/:id'

def update
    production = Production.find(params[:id])
    production.update(production_params)
    render json: production, status: :ok
    # production.update(production_params[:director]) # restrict our user to only being able to update the director
    rescue ActiveRecord::RecordNotFound => error
        render json: { message: error.message }
end

# destroy a specific production
# DELETE '/productions/:id'

def destroy
    production = Production.find(params[:id])
    production.destroy
    head :no_content

    rescue ActiveRecord::RecordNotFound => error
        render json: { message: error.message }
end

private

def production_params
    params.permit(:title, :genre, :director, :description, :image, :budget, :ongoing)
end

end
