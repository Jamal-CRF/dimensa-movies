# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  describe 'POST #import' do
    it 'imports movies from CSV file' do
      file_path = Rails.root.join('netflix_titles.csv')

      expect do
        post :import, params: { file: fixture_file_upload(file_path, 'text/csv') }
      end.to change(Movie, :count).by(131)

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ message: 'Import successful' }.to_json)
    end
  end

  describe 'GET #index' do
    it 'returns a list of movies sorted by year of release' do
      movies = FactoryBot.create_list(:movie, 10)
      expected_ids = movies.sort_by(&:year).pluck(:id)

      get :index

      expect(response).to have_http_status(:ok)
      returned_ids = JSON.parse(response.body).map { |movie| movie['id'] }
      expect(returned_ids).to eq(expected_ids)
    end

    it 'returns filtered movies' do
      movies = FactoryBot.create_list(:movie, 10)

      filtered_by_title = movies.select { |movie| movie.title == 'Movie 1' }
      filtered_by_genre = movies.select { |movie| movie.genre == 'Action' }
      filtered_by_year = movies.select { |movie| movie.year == 1993 }
      filtered_by_country = movies.select { |movie| movie.country == 'United States' }
      filtered_by_published_at = movies.select { |movie| movie.published_at == 'April 1, 2019' }
      filtered_by_description = movies.select { |movie| movie.description == 'Description 1' }

      expected_ids = filtered_by_year.pluck(:id)

      get :index, params: { title: 'Movie 1' }
      returned_ids = JSON.parse(response.body).pluck('id')
      expect(returned_ids).to match_array(filtered_by_title.pluck(:id))

      get :index, params: { description: 'Description 1' }
      returned_ids = JSON.parse(response.body).pluck('id')
      expect(returned_ids).to match_array(filtered_by_description.pluck(:id))

      get :index, params: { published_at: 'April 1, 2019' }
      returned_ids = JSON.parse(response.body).pluck('id')
      expect(returned_ids).to match_array(filtered_by_published_at.pluck(:id))

      get :index, params: { year: 1993 }
      returned_ids = JSON.parse(response.body).pluck('id')
      expect(returned_ids).to match_array(expected_ids)

      get :index, params: { country: 'United States' }
      returned_ids = JSON.parse(response.body).pluck('id')
      expect(returned_ids).to match_array(filtered_by_country.pluck(:id))

      get :index, params: { genre: 'Action' }
      returned_ids = JSON.parse(response.body).pluck('id')
      expect(returned_ids).to match_array(filtered_by_genre.pluck(:id))
    end
  end
end
