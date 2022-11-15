class Spell < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :user, presence: true
end
