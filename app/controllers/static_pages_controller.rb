class StaticPagesController < ApplicationController
  def home
    @localtrade = current_user.localtrades.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
