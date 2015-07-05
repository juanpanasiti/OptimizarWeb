class WelcomeController < ApplicationController
	before_action :authenticate_admin!, only: [:dashboard]
  def index
  end

  def about
  end

  def contact
  end

  def dashboard
  	@articles = Articles.all
  end
end
