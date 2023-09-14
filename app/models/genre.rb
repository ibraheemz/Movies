class Genre < ApplicationRecord
    has_many :genrizations, dependent: :destroy
    has_many :movies, through: :genrizations

    validates :name, presence: true, uniqueness: true
end
