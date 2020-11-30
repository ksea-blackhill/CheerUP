class SupportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist, only: [:index,:create]
  def index
    @artist_form = ArtistForm.new
  end
  
  def create
    @artist_form = ArtistForm.new(form_params)
    if @artist_form.valid?
      @artist_form.save
      redirect_to root_path(@artist_form)
    else
      render action: :index
    end
  end

  private

  def form_params
    params.require(:artist_form).permit(:price, :comment, :support_id).merge( user_id: current_user.id, artist_id: params[:artist_id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
