class CardNumbersController < ApplicationController
  # GET /card_numbers
  # GET /card_numbers.json
  def index
    @card_numbers = CardNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @card_numbers }
    end
  end

  # GET /card_numbers/1
  # GET /card_numbers/1.json
  def show
    @card_number = CardNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card_number }
    end
  end

  # GET /card_numbers/new
  # GET /card_numbers/new.json
  def new
    @card_number = CardNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card_number }
    end
  end

  # GET /card_numbers/1/edit
  def edit
    @card_number = CardNumber.find(params[:id])
  end

  # POST /card_numbers
  # POST /card_numbers.json
  def create
    @card_number = CardNumber.new(params[:card_number])
    length = @card_number.number.size
    if length == 15 && @card_number.number =~ /^(34|37)/
    @card_number.card_type = "American Express"
    elsif length == 16 && @card_number.number =~ /^6011/
    @card_number.card_type = "Discover"
    elsif length == 16 && @card_number.number =~ /^5[1-5]/
    @card_number.card_type = "MasterCard"
    elsif (length == 13 || length == 16) && @card_number.number =~ /^4/
    @card_number.card_type = "Visa"
    elsif length == 14 && @card_number.number =~ /^30[0-5]|36|38|/
    @card_number.card_type = "Diners"
    else
    @card_number.card_type = "Unknown"
    end    
    respond_to do |format|
      if @card_number.save
        format.html { redirect_to @card_number, notice: 'Broj kartice je uspjesno spremljen u bazu.' }
        format.json { render json: @card_number, status: :created, location: @card_number }
      else
        format.html { render action: "new" }
        format.json { render json: @card_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /card_numbers/1
  # PUT /card_numbers/1.json
  def update
    @card_number = CardNumber.find(params[:id])

    respond_to do |format|
      if @card_number.update_attributes(params[:card_number])
        format.html { redirect_to @card_number, notice: 'Broj kartice je uspjesno azuriran.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_numbers/1
  # DELETE /card_numbers/1.json
  def destroy
    @card_number = CardNumber.find(params[:id])
    @card_number.destroy

    respond_to do |format|
      format.html { redirect_to card_numbers_url }
      format.json { head :no_content }
    end
  end


end

