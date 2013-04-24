class LocaltradesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :index, :edit, :update]

  # GET /localtrades
  # GET /localtrades.json
  def index
    @localtrades = Localtrade.paginate(page: params[:page])
  end

  def show
    @localtrade = Localtrade.find(params[:id])
  end

  def create
    @localtrade = current_user.localtrades.build(params[:localtrades_form])
    if @localtrade.save
      flash[:success] = "Trade saved!"
      redirect_to new_localtrade_path
    else
      render 'new'
    end
  end

  def edit
    @localtrade = Localtrade.find(params[:id])
  end

  def update
    @localtrade = Localtrade.find(params[:id])
    if @localtrade.update_attributes(params[:localtrade])
      flash[:success] = "Trade updated"
      redirect_to localtrades_path
    else
      render 'edit'
    end
  end

  def new
    @localtrade = current_user.localtrades.build()
  end

  def destroy
    @localtrade = Localtrade.find(params[:id])
    @localtrade.destroy
    redirect_to localtrades_path
  end
end
