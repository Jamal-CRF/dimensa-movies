# frozen_string_literal: true

require 'csv'
module Api
  module V1
    class MoviesController < ApplicationController
      def import
        file_path = 'netflix_titles.csv'

        CSV.foreach(file_path, headers: true) do |row|
          Movie.find_or_create_by(title: row['title']) do |movie|
            movie.genre = row['type']
            movie.year = row['release_year']
            movie.country = row['country']
            movie.published_at = row['date_added']
            movie.description = row['description']
          end
        end
        render json: { message: 'Import successful' }, status: :ok
      end

      def index
        movies = Movie.order(year: :asc)
        movies = filter_movies(movies, params)
        movies = movies.page(params[:page]).per(params[:per_page])
        render json: movies, status: :ok
      end

      private

      def filter_movies(movies, filters)
        filters.slice(:title, :genre, :year, :country, :published_at, :description).each do |key, value|
          movies = movies.where(key => value)
        end
        movies
      end
    end
  end
end
