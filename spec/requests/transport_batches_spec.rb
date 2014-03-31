require 'spec_helper'

describe "TransportBatches" do
  describe "GET /transport_batches" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get transport_batches_path
      response.status.should be(200)
    end
  end
end
