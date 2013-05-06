require 'spec_helper'

module Geonames
  describe WebService do
    describe ".neighbourhood" do
      subject { WebService.neighbourhood(latitude, longitude) }
      let(:response) { File.read File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'neighbourhood', fixture) }

      before { FakeWeb.register_uri :get, /\/neighbourhood\?.*lat=#{latitude}&lng=#{longitude}/, :response => response }
      let(:fixture) { "new_york.xml.http" }

      let(:latitude)  { +40.78343 }
      let(:longitude) { -73.96625 }

      it { should be_a_kind_of(Array) }

      it "returns Neighbourhood instance" do
        subject.each do |element|
          element.should be_a_kind_of Neighbourhood
        end
      end
    end
  end
end
