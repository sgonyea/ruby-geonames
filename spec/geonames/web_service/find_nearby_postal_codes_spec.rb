require 'spec_helper'

module Geonames
  describe WebService do
    describe ".find_nearby_postal_codes" do
      subject { WebService.find_nearby_postal_codes(criteria) }
      let(:response) { File.read File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'find_nearby_postal_codes', fixture) }

      context "lookup by place name" do
        before { FakeWeb.register_uri :get, /\/findNearbyPostalCodes\?.*&placename=Oshawa/, :response => response }
        let(:fixture) { "oshawa.xml.http" }

        let :criteria do
          Geonames::PostalCodeSearchCriteria.new.tap do |criteria|
            criteria.place_name = "Oshawa"
          end
        end

        it { should be_a_kind_of(Array) }

        it "returns PostalCode instances" do
          subject.each do |element|
            element.should be_a_kind_of PostalCode
          end
        end
      end
    end
  end
end
