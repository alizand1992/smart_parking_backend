# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    name { 'North Garage' }
    add_attribute(:desc) { 'This is a 6 floor parking garage structure located between the 9th and 10th street' }
  end
end
