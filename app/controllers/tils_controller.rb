class TilsController < ApplicationController
  respond_to :json

  def create
    til = Til.new(params[:til])
    til.save
    respond_with til
  end
end
