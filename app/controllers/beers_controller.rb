class BeersController < ApplicationController
  before_action :authenticate!

  def index
    render json: BeersQuery.call({})
  end
end
