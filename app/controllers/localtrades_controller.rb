class LocaltradesController < ApplicationController
  # GET /localtrades
  # GET /localtrades.json
  def index
    @localtrades = Localtrade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localtrades }
    end
  end

  # GET /localtrades/1
  # GET /localtrades/1.json
  def show
    @localtrade = Localtrade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @localtrade }
    end
  end

  # GET /localtrades/new
  # GET /localtrades/new.json
  def new
    @localtrade = Localtrade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @localtrade }
    end
  end

  # GET /localtrades/1/edit
  def edit
    @localtrade = Localtrade.find(params[:id])
  end

  # POST /localtrades
  # POST /localtrades.json
  def create
    @localtrade = Localtrade.new(params[:localtrade])

    respond_to do |format|
      if @localtrade.save
        format.html { redirect_to @localtrade, notice: 'Localtrade was successfully created.' }
        format.json { render json: @localtrade, status: :created, location: @localtrade }
      else
        format.html { render action: "new" }
        format.json { render json: @localtrade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /localtrades/1
  # PUT /localtrades/1.json
  def update
    @localtrade = Localtrade.find(params[:id])

    respond_to do |format|
      if @localtrade.update_attributes(params[:localtrade])
        format.html { redirect_to @localtrade, notice: 'Localtrade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @localtrade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localtrades/1
  # DELETE /localtrades/1.json
  def destroy
    @localtrade = Localtrade.find(params[:id])
    @localtrade.destroy

    respond_to do |format|
      format.html { redirect_to localtrades_url }
      format.json { head :no_content }
    end
  end
end
