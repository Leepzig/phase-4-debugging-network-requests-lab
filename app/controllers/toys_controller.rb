class ToysController < ApplicationController
  wrap_parameters format: []
  before_action :find_toy, only: [:update, :destroy, :like]

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    @toy.update(toy_params)
    render json: @toy
  end

  def destroy
    @toy.destroy
    head :no_content
  end

  def like
    @toy.update(likes: @toy.likes += 1)
    render json: @toy
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

  def find_toy
    @toy = Toy.find_by(id: params[:id])
  end
end
