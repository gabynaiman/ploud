class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index

  def index
    render :text => '<h2>Welcome to Ploud</h2>', :layout => 'application'
  end

end