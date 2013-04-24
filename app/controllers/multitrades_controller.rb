class MultitradesController < ApplicationController
  include ActionView::Helpers::TextHelper

  respond_to :html

  def create
    @multitrade = Multitrade.new(params[:multitrades_form])
    if @multitrade and @multitrade.valid?
      user = current_user
      errors, counter = @multitrade.create_trades(user)
      if !errors.empty?
        flash[:failure] = errors.unshift("Data Invalid for Trade: #{counter}").join("<br/>").html_safe
        render 'new'
      else
        flash[:success] = "Valid form. " + pluralize(counter, "trade") + " created." 
        redirect_to new_multitrade_path
      end
    else
      render 'new'
      # redirect_to root_url(:multitrade_flag => 1, :multitrade => @multitrade)
    end
  end

  def new
    @multitrade = Multitrade.new
  end

end
