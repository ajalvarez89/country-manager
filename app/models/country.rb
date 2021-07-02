# frozen_string_literal: true

class Country
  def initialize(params)
    @attributes = JSON.parse(params.to_json, object_class: OpenStruct)
  end

  def name
    @attributes[:name]
  end

  def capital
    @attributes[:capital]
  end

  def subregion
    @attributes[:subregion]
  end

  def timezones
    @attributes[:timezones]
  end

  def flag
    @attributes[:flag]
  end

  private

  attr_reader :attributes
end
