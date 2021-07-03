# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    name { 'Colombia' }
    capital { 'Bogota' }
    region { 'Latam' }
    subregion { 'Sur Amarica' }
    flag { 'http://flag.com' }
  end
end
