# frozen_string_literal: true

FactoryBot.define do
  factory :parking_spot do
    number { 'A1' }
    aws_id { 'f53f8165f8fd8' }
    location { create(:location) }
  end
end
