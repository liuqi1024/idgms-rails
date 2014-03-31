require 'spec_helper'

describe "transport_batches/index" do
  before(:each) do
    assign(:transport_batches, [
      stub_model(TransportBatch,
        :product_batch => nil,
        :code => "Code"
      ),
      stub_model(TransportBatch,
        :product_batch => nil,
        :code => "Code"
      )
    ])
  end

  it "renders a list of transport_batches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
