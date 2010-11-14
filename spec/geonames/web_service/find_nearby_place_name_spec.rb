require 'spec_helper'

module Geonames
  describe WebService do
    describe ".find_nearby_place_name" do
      subject { WebService.find_nearby_place_name(latitude, longitude) }
      let(:response) { File.read File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'find_nearby_place_name', fixture) }

      before { FakeWeb.register_uri :get, /\/findNearbyPlaceName\?.*lat=#{latitude}&lng=#{longitude}/, :response => response }
      let(:fixture) { "oshawa.xml.http" }

      let(:latitude)  { +43.900120387 }
      let(:longitude) { -78.882869834 }

      it { should be_a_kind_of(Array) }

      it "returns Toponym instances" do
        subject.each do |element|
          element.should be_a_kind_of Toponym
        end
      end
    end
  end
end
