class Movie < ApplicationRecord
    before_save :set_slug

    has_many :reviews, dependent: :destroy
    has_many :favs, dependent: :destroy
    has_many :favers, through: :favs, source: :user
    has_many :genrizations, dependent: :destroy
    has_many :genres, through: :genrizations

    has_one_attached :poster_image

    validates :title, presence: true, uniqueness: true
    validates :released_on, presence: true 
    validates :rating, length: { minimum: 4, maxmum: 4, message: "must have one at least" }
    validates :description, length: { minimum: 25 }

    validate :acceptable_poster

    scope :upcoming, -> { where("released_on > ?", Time.now).order("released_on") }
    scope :released, -> { where("released_on < ?", Time.now).order("released_on") }

    def to_param
        slug
    end

    def average_stars
        reviews.average(:stars) || 0.0
    end

    def average_stars_as_percent
        (self.average_stars / 5.0) * 100
    end

    private

        def set_slug
            self.slug = title.parameterize
        end

        def acceptable_poster
            return unless poster_image.attached?

            unless poster_image.blob.byte_size <= 1.megabyte
                errors.add(:poster_image, message: "is too big, must be less than 1 MB")
            end

            acceptable_types = ["image/jpeg", "image/png"]
            unless acceptable_types.include?(poster_image.content_type)
                errors.add(:poster_image, message: "must be JPEG or PNG")
            end

        end

end
