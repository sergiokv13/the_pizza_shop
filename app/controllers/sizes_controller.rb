class SizesController < ApplicationController
  before_action :set_size, only: [:show, :update, :destroy]

  # GET /sizes
  def index
    @sizes = Size.all

    render json: @sizes
  end

  # GET /sizes/1
  def show
    render json: @size
  end

  # POST /sizes
  def create
    @size = Size.new(size_params)

    if @size.save
      render json: @size, status: :created, location: @size
    else
      render json: @size.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sizes/1
  def update
    if @size.update(size_params)
      render json: @size
    else
      render json: @size.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sizes/1
  def destroy
    @size.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size
      if Size.where(id: params[:id]).empty?
        #If the record is not found return error message
        render :json => {:error => "not-found"}.to_json, :status => 404
      else
        @size = Size.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def size_params
      params.require(:size).permit(:name, :slices)
    end
end
