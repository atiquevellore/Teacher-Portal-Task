# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    name { 'John Doe' }
    subject { 'Math' }
    mark { 85 }
    association :user
  end
end
