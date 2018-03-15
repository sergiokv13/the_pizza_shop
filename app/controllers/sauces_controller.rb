class SaucesController < ApplicationController
  before_action :set_sauce, only: [:show, :update, :destroy]

  # GET /sauces
  def index
    @sauces = Sauce.all

    render json: @sauces
  end

  # GET /sauces/1
  def show
    render json: @sauce
  end

  # POST /sauces
  def create
    @sauce = Sauce.new(sauce_params)

    if @sauce.save
      render json: @sauce, status: :created, location: @sauce
    else
      render json: @sauce.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sauces/1
  def update
    if @sauce.update(sauce_params)
      render json: @sauce
    else
      render json: @sauce.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sauces/1
  def destroy
    @sauce.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sauce
      if Sauce.where(id: params[:id]).empty?
        #If the record is not found return error message
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        @sauce = Sauce.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def sauce_params
      params.require(:sauce).permit(:name)
    end
end
