class HomeController < ApplicationController
  def index
    render json: { se_liga: 'to vivo mano' }
  end
end
