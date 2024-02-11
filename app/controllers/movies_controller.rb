class MoviesController < ApplicationController
  # GET /movies
  def index
    @movies = Movie.all
    @movies = @movies.by_actor_name(params[:search]) if params[:search].present?
    @movies = @movies.includes(:actors, :directors, :countries, :locations)
    @pagy, @movies = pagy(@movies, items: 10)
    @movies = @movies.order_by_rating
  end
end
