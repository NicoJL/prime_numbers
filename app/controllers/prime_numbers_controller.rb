class PrimeNumbersController < ApplicationController
  before_action :set_prime_number, only: %i[ show edit update destroy ]

  # GET /prime_numbers or /prime_numbers.json
  def index
    @prime_numbers = PrimeNumber.all
  end

  # GET /prime_numbers/1 or /prime_numbers/1.json
  def show
  end

  # GET /prime_numbers/new
  def new
    @prime_number = PrimeNumber.new
  end

  # GET /prime_numbers/1/edit
  def edit
  end

  # POST /prime_numbers or /prime_numbers.json
  def create
    @prime_number = PrimeNumber.new(prime_number_params)
    status = false
    message = 'Prime number was successfully created.'

    respond_to do |format|
      if @prime_number.save
        @prime_number.save_prime_befores
        status = true

        format.html { redirect_to @prime_number, notice: "Prime number was successfully created." }
        format.json { render :show, status: :created, location: @prime_number }
      else
        message = @prime_number.errors.full_messages.join(', ')
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prime_number.errors, status: :unprocessable_entity }
      end

      format.js { render 'create.js.erb', locals: { status: status, message: ''}}
    end
  end

  # PATCH/PUT /prime_numbers/1 or /prime_numbers/1.json
  def update
    respond_to do |format|
      if @prime_number.update(prime_number_params)
        format.html { redirect_to @prime_number, notice: "Prime number was successfully updated." }
        format.json { render :show, status: :ok, location: @prime_number }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prime_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prime_numbers/1 or /prime_numbers/1.json
  def destroy
    @prime_number.destroy
    respond_to do |format|
      format.html { redirect_to prime_numbers_url, notice: "Prime number was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prime_number
      @prime_number = PrimeNumber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prime_number_params
      params.require(:prime_number).permit(:prime_number, prime_elements:[])
    end
end
