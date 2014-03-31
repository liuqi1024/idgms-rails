require 'spec_helper'

describe "product_batches/show" do
  before(:each) do
    @product_batch = assign(:product_batch, stub_model(ProductBatch,
      :worksheet => nil,
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
