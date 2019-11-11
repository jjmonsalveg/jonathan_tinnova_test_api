class BeersController < ApplicationController
  before_action :authenticate!
  before_action :set_beer, only: :show

  def index
    render json: BeersQuery.call(params)
  end

  def show
    if @beer
      render json: @beer, status: 200
    else
      render json: { error: 'Couldn\'t find Beer' }, status: :not_found
    end
  end

  private

  def set_beer
     @beer = Beer.find_by(id: params[:id])
  end
end
