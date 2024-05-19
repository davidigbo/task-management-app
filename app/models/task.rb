class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :state, inclusion: { in: %w[not_started in_progress completed] }
  validates :completed, inclusion: { in: [true, false] }

  before_save :update_completed

  private

  def update_completed
    self.completed = (status == 'completed')
  end  
end
