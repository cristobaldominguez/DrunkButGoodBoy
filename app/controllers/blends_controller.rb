class BlendsController < ApplicationController
  before_action :set_blend, only: %i[ show edit update destroy ]

  # GET /blends or /blends.json
  def index
    @blends = Blend.all
  end

  # GET /blends/1 or /blends/1.json
  def show
  end

  # GET /blends/new
  def new
    @blend = Blend.new
  end

  # GET /blends/1/edit
  def edit
  end

  # POST /blends or /blends.json
  def create
    @blend = Blend.new(blend_params)

    respond_to do |format|
      if @blend.save
        format.html { redirect_to blend_url(@blend), notice: "Blend was successfully created." }
        format.json { render :show, status: :created, location: @blend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blends/1 or /blends/1.json
  def update
    respond_to do |format|
      if @blend.update(blend_params)
        format.html { redirect_to blend_url(@blend), notice: "Blend was successfully updated." }
        format.json { render :show, status: :ok, location: @blend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blends/1 or /blends/1.json
  def destroy
    @blend.destroy

    respond_to do |format|
      format.html { redirect_to blends_url, notice: "Blend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blend
      @blend = Blend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blend_params
      params.require(:blend).permit(:percentage, :wine_id, :strain_id)
    end
end
