class Task < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 5 }
end
