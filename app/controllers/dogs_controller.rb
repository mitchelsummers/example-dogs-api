class DogsController < ApplicationController
  def create
    if current_user
      dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed]
      )
      if dog.save
        render json: dog.as_json
      else
        render json: dog.errors.full_message
      end
    else
      render json: { message: "please sign in"}
    end
  end
end
