class ArtistsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @artist = Artist.all.order(created_at: "DESC")
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def artist_params
    params.require(:artist).permit(:image,:name,:description,:genre_id,:sub_genre_id,:member_id,:artist_gender_id,:prefecture_id,:social,:video,:url).merge(user_id: current_user.id)
  end

  
end
