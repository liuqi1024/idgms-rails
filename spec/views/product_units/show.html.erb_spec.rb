require 'spec_helper'

describe "product_units/show" do
  before(:each) do
    @product_unit = assign(:product_unit, stub_model(ProductUnit,
      :game => nil,
      :product_batch => nil,
      :code => "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Code/)
  end
end
