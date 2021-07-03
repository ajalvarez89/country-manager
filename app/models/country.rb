# frozen_string_literal: true

class Country
  include ActiveModel::Model
  attr_accessor :name, :capital, :subregion, :timezones, :flag

  def initialize(params)
    @attributes = JSON.parse(params.to_json, object_class: OpenStruct)
    @name = @attributes[:name]
    @capital = @attributes[:capital]
    @subregion = @attributes[:subregion]
    @timezones = @attributes[:timezones]
    @flag = @attributes[:flag]
  end

  private

  attr_reader :attributes
end
