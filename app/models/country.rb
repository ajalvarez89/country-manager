# frozen_string_literal: true

class Country
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :capital, type: String
  field :region, type: String
  field :subregion, type: String
  field :flag, type: String

  validates :name, :flag, presence: true

  scope :recents, -> { order(created_at: :desc) }
end
