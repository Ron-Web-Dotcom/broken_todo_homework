class Project < ApplicationRecord
  validates :title, presence: true
  has_many :items, dependent: :destroy
end
