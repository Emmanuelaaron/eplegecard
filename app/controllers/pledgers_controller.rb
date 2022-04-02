require 'vonage'
class PledgersController < ApplicationController
  before_action :set_pledger, only: %i[show edit update destroy]

  # GET /pledgers or /pledgers.json
  def index
    @pledgers = Pledger.all
  end

  # GET /pledgers/1 or /pledgers/1.json
  def show; end

  # GET /pledgers/new
  def new
    @pledger = Pledger.new
  end

  # GET /pledgers/1/edit
  def edit; end

  # POST /pledgers or /pledgers.json
  def create
    @pledger = Pledger.new(pledger_params)
    client = Vonage::Client.new(api_key: ENV['api_key_vonage'], api_secret: ENV['api_secret_vonage'])
    respond_to do |format|
      if @pledger.save
        client.sms.send(
          from: 'Vonage APIs',
          to: pledger_params['phonenumber'],
          text: 'Hello Buddy sasula Sente ze embaga'
        )
        format.html { redirect_to pledger_url(@pledger), notice: 'Pledger was successfully created.' }
        format.json { render :show, status: :created, location: @pledger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pledgers/1 or /pledgers/1.json
  def update
    respond_to do |format|
      if @pledger.update(pledger_params)
        format.html { redirect_to pledger_url(@pledger), notice: 'Pledger was successfully updated.' }
        format.json { render :show, status: :ok, location: @pledger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pledgers/1 or /pledgers/1.json
  def destroy
    @pledger.destroy

    respond_to do |format|
      format.html { redirect_to pledgers_url, notice: 'Pledger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pledger
    @pledger = Pledger.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pledger_params
    params.require(:pledger).permit(:name, :phonenumber, :amount, :expecteddate, :fullfilled)
  end
end
