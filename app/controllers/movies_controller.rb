# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
 
  def create
    #@movie = Movie.create!(params[:movie]) #old way
    @movie = Movie.create!(movie_params)  # new way
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end
  
  def update
    @movie = Movie.find params[:id]
    #@movie.update_attributes!(params[:movie])  # old way
    @movie.update_attributes!(movie_params)  # new way  
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

 
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
   # will render app/views/movies/show.html.haml by default
  end
  def new
    # defaut: render 'new' templates
  end
  #MAKE SURE THIS ENTIRE BLOCK IS LAST
   private
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
  ##END LAST BLOCK
end