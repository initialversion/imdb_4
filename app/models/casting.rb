class Casting < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :actor_id, :presence => true

  validates :movie_id, :presence => true

end
