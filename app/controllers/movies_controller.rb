class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show]

  # GET /movies
  def index
    @movies = Movie.all
    @movies = @movies.by_actor_name(params[:search]) if params[:search].present?
  end

  # GET /movies/1
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end
end
