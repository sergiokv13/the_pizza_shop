class PizzasController < ApplicationController
  before_action :set_pizza, only: [:show, :update, :destroy, :add_ingredient,:ingredients]

  # GET /pizzas
  def index
    @pizzas = Pizza.all

    render json: @pizzas
  end

  # GET /pizzas/1
  def show
    render json: @pizza
  end

  # POST /pizzas
  def create
    @pizza = Pizza.new(pizza_params)

    if @pizza.save
      render json: @pizza, status: :created, location: @pizza
    else
      render json: @pizza.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pizzas/1
  def update
    if @pizza.update(pizza_params)
      render json: @pizza
    else
      render json: @pizza.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pizzas/1
  def destroy
    @pizza.destroy
  end

  # GET Add ingredient /ingredients/ingredient_id
  def add_ingredient
    @pizza.add_ingredient(params[:ingredient_id])
    render json: @pizza
  end


  # GET pizza/:id/ingredients
  def ingredients
    render json: @pizza.ingredients
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza
      if Pizza.where(id: params[:id]).empty?
        #If the record is not found return error message
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        @pizza = Pizza.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def pizza_params
      params.require(:pizza).permit(:pizza_type_id, :cheese_id, :sauce_id, :crust_id, :size_id, :ingredient_id)
    end
end
