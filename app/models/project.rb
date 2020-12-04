#Class Project  contains validation for the  Application Record 
class Project < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :title, message:'This data has been used Please Try Again'
  has_many :items, dependent: :destroy
end
