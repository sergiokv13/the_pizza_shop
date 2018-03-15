class CrustsController < ApplicationController
  before_action :set_crust, only: [:show, :update, :destroy]

  # GET /crusts
  def index
    @crusts = Crust.all

    render json: @crusts
  end

  # GET /crusts/1
  def show
    render json: @crust
  end

  # POST /crusts
  def create
    @crust = Crust.new(crust_params)

    if @crust.save
      render json: @crust, status: :created, location: @crust
    else
      render json: @crust.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /crusts/1
  def update
    if @crust.update(crust_params)
      render json: @crust
    else
      render json: @crust.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crusts/1
  def destroy
    @crust.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crust
      if Crust.where(id: params[:id]).empty?
        #If the record is not found return error message
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        @crust = Crust.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def crust_params
      params.require(:crust).permit(:name)
    end
end
