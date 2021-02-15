class PrimeNumberBeforesController < ApplicationController
  before_action :set_prime_number_before, only: %i[ show edit update destroy ]

  # GET /prime_number_befores or /prime_number_befores.json
  def index
    @prime_number_befores = PrimeNumberBefore.all
  end

  # GET /prime_number_befores/1 or /prime_number_befores/1.json
  def show
  end

  # GET /prime_number_befores/new
  def new
    @prime_number_before = PrimeNumberBefore.new
  end

  # GET /prime_number_befores/1/edit
  def edit
  end

  # POST /prime_number_befores or /prime_number_befores.json
  def create
    @prime_number_before = PrimeNumberBefore.new(prime_number_before_params)

    respond_to do |format|
      if @prime_number_before.save
        format.html { redirect_to @prime_number_before, notice: "Prime number before was successfully created." }
        format.json { render :show, status: :created, location: @prime_number_before }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prime_number_before.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prime_number_befores/1 or /prime_number_befores/1.json
  def update
    respond_to do |format|
      if @prime_number_before.update(prime_number_before_params)
        format.html { redirect_to @prime_number_before, notice: "Prime number before was successfully updated." }
        format.json { render :show, status: :ok, location: @prime_number_before }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prime_number_before.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prime_number_befores/1 or /prime_number_befores/1.json
  def destroy
    @prime_number_before.destroy
    respond_to do |format|
      format.html { redirect_to prime_number_befores_url, notice: "Prime number before was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prime_number_before
      @prime_number_before = PrimeNumberBefore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prime_number_before_params
      params.require(:prime_number_before).permit(:number, :prime_number_id)
    end
end
