class MoviesController < ApplicationController
  before_action :set_params, only: [:show]
  def index
    @movies = Movie.all
    @movies = @movies.where("name ILIKE ?", "%#{params[:search]}%") if params[:search].present?
    render json: @movies
  end

  def show
    render json: @movie, include: :shows
  end

  def set_params
    @movie = Movie.find(params[:id])
  end

end