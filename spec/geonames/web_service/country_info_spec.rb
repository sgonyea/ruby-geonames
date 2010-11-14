require 'spec_helper'

module Geonames
  describe WebService do
    describe ".country_info" do
      subject { country_info }
      let(:country_info) { WebService.country_info(country_code) }
      let(:response) { File.read File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'country_info', fixture) }

      context "with a country code of 'TH'" do
        before { FakeWeb.register_uri :get, /\/countryInfo\?.*&country=#{country_code}/, :response => response }
        let(:fixture) { "thailand.xml.http" }
        let(:country_code) { "TH" }

        it { should be_a_kind_of(CountryInfo) }

        its(:country_code)  { should == 'TH' }
        its(:country_name)  { should == 'Thailand' }
        its(:iso_numeric)   { should == 764 }
        its(:iso_alpha_3)   { should == 'THA' }
        its(:fips_code)     { should == 'TH' }
        its(:continent)     { should == 'AS' }
        its(:capital)       { should == 'Bangkok' }
        its(:area_sq_km)    { should == 514000.0 }
        its(:population)    { should == 67089500 }
        its(:currency_code) { should == 'THB' }
        its(:geoname_id)    { should == 1605651 }
        its(:languages)     { should == ['th', 'en'] }

        describe "#bounding_box" do
          subject { country_info.bounding_box }

          it { should be_a_kind_of(BoundingBox) }
          its(:north_point) { should == 20.463194 }
          its(:south_point) { should == 5.61 }
          its(:east_point)  { should == 105.639389 }
          its(:west_point)  { should == 97.345642 }
        end
      end
    end
  end
end
