class ExpertsController < ApplicationController
  allow_cors :index

  def index
    render :json => Expert.all
  end
end
