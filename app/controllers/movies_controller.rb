class MoviesController < ApplicationController
  before_action :set_params, only: [:show]
  def index
    @movies = Movie.all
    @movies = @movies.where("name ILIKE ?", "%#{params[:search]}%") if params[:search].present?
    render json: @movies.map { |movie|
      {
        id: movie.id,
        name: movie.name,
        release_date: movie.release_date,
        image_url: movie.image.attached? ?
          rails_blob_url(movie.image) : nil
      }
    }
  end

  def show
    render json: @movie.as_json(
      include: :shows
    ).merge(
      image_url: @movie.image.attached? ? url_for(@movie.image) : nil
    )
  end

  def set_params
    @movie = Movie.find(params[:id])
  end

end