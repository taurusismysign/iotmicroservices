class CategoriesController < ApplicationController
  allow_cors :index

  def index
    render :json => Category.all
  end

end
