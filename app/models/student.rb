class Student < ApplicationRecord
  belongs_to :instructor

  validates :name, presence: true
  validates :age, numericality: {greater_than_or_equla_to: 18, only_integer: true}
end
