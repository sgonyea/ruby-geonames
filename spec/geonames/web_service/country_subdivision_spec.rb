require 'spec_helper'

module Geonames
  describe WebService do
    describe ".country_subdivision" do
      subject { WebService.country_subdivision(latitude, longitude) }
      let(:response) { File.read File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'country_subdivision', fixture) }

      before { FakeWeb.register_uri :get, /\/countrySubdivision\?.*lat=#{latitude}&lng=#{longitude}/, :response => response }
      let(:fixture) { "ontario.xml.http" }

      let(:latitude)  { +43.900120387 }
      let(:longitude) { -78.882869834 }

      it { should be_a_kind_of(Array) }

      it "returns CountrySubdivision instances" do
        subject.each do |element|
          element.should be_a_kind_of CountrySubdivision
        end
      end
    end
  end
end
