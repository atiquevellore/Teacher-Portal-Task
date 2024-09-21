# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :subject, presence: true
  validates :mark, presence: true, length: { minimum: 1, maximum: 3 }
end
