class NonPizzasController < ApplicationController
  before_action :set_non_pizza, only: [:show, :update, :destroy]

  # GET /non_pizzas
  def index
    @non_pizzas = NonPizza.all

    render json: @non_pizzas
  end

  # GET /non_pizzas/1
  def show
    render json: @non_pizza
  end

  # POST /non_pizzas
  def create
    @non_pizza = NonPizza.new(non_pizza_params)

    if @non_pizza.save
      render json: @non_pizza, status: :created, location: @non_pizza
    else
      render json: @non_pizza.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /non_pizzas/1
  def update
    if @non_pizza.update(non_pizza_params)
      render json: @non_pizza
    else
      render json: @non_pizza.errors, status: :unprocessable_entity
    end
  end

  # DELETE /non_pizzas/1
  def destroy
    @non_pizza.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_non_pizza
      if NonPizza.where(id: params[:id]).empty?
        #If the record is not found return error message
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        @non_pizza = NonPizza.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def non_pizza_params
      params.require(:non_pizza).permit(:name)
    end
end
