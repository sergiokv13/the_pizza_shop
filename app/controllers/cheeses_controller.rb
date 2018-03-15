class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :update, :destroy]

  # GET /cheeses
  def index
    @cheeses = Cheese.all

    render json: @cheeses
  end

  # GET /cheeses/1
  def show
    render json: @cheese
  end

  # POST /cheeses
  def create
    @cheese = Cheese.new(cheese_params)

    if @cheese.save
      render json: @cheese, status: :created, location: @cheese
    else
      render json: @cheese.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cheeses/1
  def update
    if @cheese.update(cheese_params)
      render json: @cheese
    else
      render json: @cheese.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cheeses/1
  def destroy
    @cheese.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheese
      if Cheese.where(id: params[:id]).empty?
        #If the record is not found return error message
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        @cheese = Cheese.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def cheese_params
      params.require(:cheese).permit(:name)
    end
end
