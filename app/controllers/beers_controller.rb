class BeersController < ApplicationController
  before_action :authenticate!
  before_action :set_beer, only: %i[show favorite]

  def index
    render json: BeersQuery.call(params), current_user: current_user
  end

  def show
    process_beer(current_time_params)
  end

  def favorite
    process_beer(current_time_params.merge(favorite: true))
  end

  def favorites
    render json: BeersQuery.call(params).where(beer_users: {user: current_user}), current_user: current_user
  end

  private

  def current_time_params
   { date: Date.current, time: Time.current }
  end

  def process_beer(params)
    if @beer
      BeerUser.find_or_create_by(user_id: current_user.id, beer_id: @beer.id)
              .update_attributes(params)
      render json: @beer, current_user: current_user, status: 200
    else
      render json: {error: 'Couldn\'t find Beer'}, status: :not_found
    end
  end

  def set_beer
     @beer = Beer.find_by(id: params[:id])
  end
end
