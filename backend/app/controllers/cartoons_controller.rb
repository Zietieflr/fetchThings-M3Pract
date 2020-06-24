class CartoonsController < ApplicationController
  before_action :set_cartoon, only: [:show, :update, :destroy]

  # GET /cartoons
  def index
    @cartoons = Cartoon.all

    render json: @cartoons
  end

  # GET /cartoons/1
  def show
    render json: @cartoon
  end

  # POST /cartoons
  def create
    @cartoon = Cartoon.new(cartoon_params)

    if @cartoon.save
      render json: @cartoon, status: :created, location: @cartoon
    else
      render json: @cartoon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cartoons/1
  def update
    if @cartoon.update(cartoon_params)
      render json: @cartoon
    else
      render json: @cartoon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cartoons/1
  def destroy
    @cartoon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartoon
      @cartoon = Cartoon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cartoon_params
      params.require(:cartoon).permit(:name, :image_url)
    end
end
