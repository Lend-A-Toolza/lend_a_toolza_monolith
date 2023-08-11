# frozen_string_literal: true

class StoreFacade
  def initialize(location, radius)
    @location = location
    @radius = radius
  end

  def self.get_stores(location, radius)
    location = location.gsub(' ', '%20')
    radius = (radius.to_i * 1600)
    StoreService.new.get_store(location, radius)[:results].map do |store|
      Store.new(store)
    end
  end

  def stores
    @stores ||= store_data.map do |store|
      Store.new(store)
    end
  end

  private

  def service
    @service ||= StoreService.new
  end

  def store_data
    @store_data ||= service.get_store(@location, @radius)[:results]
  end
end
