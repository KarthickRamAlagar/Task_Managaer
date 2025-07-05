class Api::V1::CatsController < ApplicationController
  def index
    cats = Cat.all
    render json: cats
  end
end
