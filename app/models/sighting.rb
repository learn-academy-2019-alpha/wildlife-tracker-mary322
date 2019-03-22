class Sighting < ApplicationRecord
    belongs_to :animal
    validates :date, :time, :latitude, :longitude, presence: true
    validates :date, :time, :latitude, :longitude, format: {:with => /\A[\[\],\p{Zs}\p{N}]+\z/, message: 'should contain only numbers'}
end
