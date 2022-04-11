class CampusController < ApplicationController
  before_action :set_campu, only: %i[ show edit update destroy ]

  # GET /campus or /campus.json
  def index
    @campus = Campu.all
  end

  # GET /campus/1 or /campus/1.json
  def show
  end

  # GET /campus/new
  def new
    @campu = Campu.new
  end

  # GET /campus/1/edit
  def edit
  end

  # POST /campus or /campus.json
  def create
    @campu = Campu.new(campu_params)

    respond_to do |format|
      if @campu.save
        format.html { redirect_to campu_url(@campu), notice: "Campu was successfully created." }
        format.json { render :show, status: :created, location: @campu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campus/1 or /campus/1.json
  def update
    respond_to do |format|
      if @campu.update(campu_params)
        format.html { redirect_to campu_url(@campu), notice: "Campu was successfully updated." }
        format.json { render :show, status: :ok, location: @campu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campus/1 or /campus/1.json
  def destroy
    @campu.destroy

    respond_to do |format|
      format.html { redirect_to campus_url, notice: "Campu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campu
      @campu = Campu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campu_params
      params.fetch(:campu, {})
    end
end
