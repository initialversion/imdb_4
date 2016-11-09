class Casting < ApplicationRecord
  # Direct associations

  belongs_to :movie

  # Indirect associations

  # Validations

  validates :actor_id, :presence => true

  validates :movie_id, :presence => true

end
