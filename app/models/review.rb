class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  
  validates :body, length: { minimum: 5, maxmum: 250}

  STARS = [1, 2, 3, 4, 5]

  validates :stars, inclusion: {
      in: STARS,
      message: "must between 1 to 5"
  }

  def stars_as_percent
    (stars / 5.0) * 100
  end

end
