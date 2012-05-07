class HomeController < ApplicationController

  def index
    render :text => 'Welcome to Ploud', :layout => 'application'
  end

end