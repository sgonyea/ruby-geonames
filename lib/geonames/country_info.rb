require 'geonames/bounding_box'

module Geonames
  class CountryInfo
    attr_accessor :country_code, :country_name, :iso_numeric, :iso_alpha_3,
                  :fips_code, :continent, :capital, :area_sq_km, :population,
                  :currency_code, :geoname_id, :bounding_box, :languages

    def initialize
      @bounding_box = BoundingBox.new
      @languages    = []
    end

    def set_bounding_box(north, south, east, west)
      @bounding_box = BoundingBox.new(north, south, east, west)
    end
  end
end
