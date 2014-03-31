require 'spec_helper'

describe "transport_batches/show" do
  before(:each) do
    @transport_batch = assign(:transport_batch, stub_model(TransportBatch,
      :product_batch => nil,
      :code => "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Code/)
  end
end
