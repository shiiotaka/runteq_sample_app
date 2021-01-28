class Task < ApplicationRecord
  validates :title, presence: true, length: {in: 5..140}
  validates :body, presence: true
end
