require 'spec_helper'

module Geonames
  describe WebService do
    describe ".postal_code_search" do
      subject { WebService.postal_code_search(criteria) }
      let(:response) { File.read File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'postal_code_search', fixture) }

      context "lookup by place name" do
        before { FakeWeb.register_uri :get, /\/postalCodeSearch\?.*&placename=Oshawa/, :response => response }
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

      context "lookup by latitude and longitude" do
        before { FakeWeb.register_uri :get, /\/postalCodeSearch\?.*&lat=47.*&lng=9/, :response => response }
        let(:fixture) { "lat_lng.xml.http" }

        let :criteria do
          Geonames::PostalCodeSearchCriteria.new.tap do |criteria|
            criteria.latitude  = 47
            criteria.longitude = 9
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
