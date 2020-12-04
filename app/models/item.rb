#Class Item  contains validation for the  Application Record 
class Item < ApplicationRecord
  belongs_to :project
  validates :action,
    presence: true,
    uniqueness: {
                  scope: :project,
                  message: 'should be unique within a project'
                }
  validates :project_id, presence: true
  scope :complete, -> { where(done: true) }
end
