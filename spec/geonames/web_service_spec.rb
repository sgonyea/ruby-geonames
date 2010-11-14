require 'spec_helper'

module Geonames
  describe WebService do
    describe ".make_request" do
      it "uses a custom User-Agent header" do
        Net::HTTP::Get.should_receive(:new).with(anything, hash_including('User-Agent' => USER_AGENT))
        Net::HTTP.stub! :start
        WebService.make_request '/foo?a=a'
      end
    end
  end
end
