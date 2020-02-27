class ArtistsController < ApplicationController
  def show 
    @artist = Artist.find(params[:id])

    @success = flash[:success]
  end 

  def index 
    @artists = Artist.all
  end


  def new 
    @artist = Artist.new 
  end 

  def create 
    artist = Artist.create(artist_params)

    if artist.valid?
      flash[:success] = "You Just Created Me!!!"
      redirect_to artist_path(artist)
    else
      flash[:errors] = artist.errors.full_messages
      redirect_to new_artist_path
    end 


  end

  private 

  def artist_params 
    params.require(:artist).permit(:name, :title)
  end 
end
