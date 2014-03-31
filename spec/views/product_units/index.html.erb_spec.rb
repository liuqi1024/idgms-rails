require 'spec_helper'

describe "product_units/index" do
  before(:each) do
    assign(:product_units, [
      stub_model(ProductUnit,
        :game => nil,
        :product_batch => nil,
        :code => "Code"
      ),
      stub_model(ProductUnit,
        :game => nil,
        :product_batch => nil,
        :code => "Code"
      )
    ])
  end

  it "renders a list of product_units" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
