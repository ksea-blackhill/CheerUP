class SupportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist, only: [:index,:create]
  def index
    @artist_form = ArtistForm.new
  end
  
  def create
    @artist_form = ArtistForm.new(form_params)
    if @artist_form.valid?
      pay_artist
      @artist_form.save
      redirect_to artist_path(@artist.id)
    else
      render action: :index
    end
  end

  private

  def form_params
    params.require(:artist_form).permit(:price, :comment,:support_id).merge(token: params[:token],user_id: current_user.id, artist_id: params[:artist_id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def pay_artist
    Payjp.api_key = ENV["PAYJP_SECRET_KEY1"]
    Payjp::Charge.create(
      amount: @artist_form.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end
end
