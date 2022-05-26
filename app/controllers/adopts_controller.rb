class AdoptsController < ApplicationController
  before_action :set_adopt, only: %i[ show edit update destroy ]

  # GET /adopts or /adopts.json
  def index
    @adopts = Adopt.all
  end

  # GET /adopts/1 or /adopts/1.json
  def show
  end

  # GET /adopts/new
  def new
    @adopt = Adopt.new
  end

  # GET /adopts/1/edit
  def edit
  end

  # POST /adopts or /adopts.json
  def create
    @adopt = Adopt.new(adopt_params)

    respond_to do |format|
      if @adopt.save
        format.html { redirect_to adopt_url(@adopt), notice: "Adopt was successfully created." }
        format.json { render :show, status: :created, location: @adopt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adopt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adopts/1 or /adopts/1.json
  def update
    respond_to do |format|
      if @adopt.update(adopt_params)
        format.html { redirect_to adopt_url(@adopt), notice: "Adopt was successfully updated." }
        format.json { render :show, status: :ok, location: @adopt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adopt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adopts/1 or /adopts/1.json
  def destroy
    @adopt.destroy

    respond_to do |format|
      format.html { redirect_to adopts_url, notice: "Adopt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adopt
      @adopt = Adopt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adopt_params
      params.require(:adopt).permit(:title, :body)
    end
end
