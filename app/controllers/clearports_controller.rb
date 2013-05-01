class ClearportsController < ApplicationController
   respond_to :json, :html

  def new
    @clearport = Clearport.new
  end

  def create
  	@clearport = Clearport.new(params[:clearport])
    if @clearport.save
 		flash[:notice] = "Trade Created"
    else
      	flash[:notice] = "Creation Failed"
    end
    respond_with @clearport
  end

  def show
  	@clearport = Clearport.find(params[:id])
  end

  def index
    @clearports = Clearport.paginate(page: params[:page])
  end

  def edit
  	@clearport = Clearport.find(params[:id])
  end

  def update
  	@clearport = Clearport.find(params[:id])
    if @clearport.update_attributes(params[:clearport])
      flash[:success] = "Trade updated"
      redirect_to clearports_path
    else
      render 'edit'
    end
  end
end
