class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true, length: { minimum: 6 }


  validates :movie_id, uniqueness: { scope: :list_id,
    message: "this movie already exists in this list" }

  # validates_uniqueness_of :movie_id, :scope => [:list_id]
end
