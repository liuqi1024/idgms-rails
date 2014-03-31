require 'spec_helper'

describe "product_batches/index" do
  before(:each) do
    assign(:product_batches, [
      stub_model(ProductBatch,
        :worksheet => nil,
        :code => "Code"
      ),
      stub_model(ProductBatch,
        :worksheet => nil,
        :code => "Code"
      )
    ])
  end

  it "renders a list of product_batches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
