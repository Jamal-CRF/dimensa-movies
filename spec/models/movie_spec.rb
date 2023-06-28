# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it 'validates presence of required attributes' do
      movie = described_class.new
      movie.valid?
      expect(movie.errors[:title]).to include('must be provided')
      expect(movie.errors[:genre]).to include('must be provided')
      expect(movie.errors[:year]).to include('must be provided')
      expect(movie.errors[:published_at]).to include('must be provided')
      expect(movie.errors[:description]).to include('must be provided')
    end

    it 'validates uniqueness of title' do
      movie1 = FactoryBot.create(:movie)
      movie2 = FactoryBot.build(:movie, title: movie1.title)
      movie2.valid?
      expect(movie2.errors[:title]).to include('must be unique')
    end
  end

  describe 'callbacks' do
    it 'sets default country if not provided' do
      movie = FactoryBot.create(:movie, country: nil)
      expect(movie.country).to eq('Country not informed')
    end
  end
end
