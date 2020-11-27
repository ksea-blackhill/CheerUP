class SupportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist, only: [:index,:create]
  def index
    @artist_form = ArtistForm.new
  end
  
  def create
    @artist_form = ArtistForm.new(form_params)
  end

  private

  def form_params
    params.require(:artist_form).permit(:price, :comment, :support_id).merge( user_id: current_user.id, artist_id: params[:artist_id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
