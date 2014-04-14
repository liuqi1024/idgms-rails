require 'spec_helper'

describe "patches/show" do
  before(:each) do
    @patch = assign(:patch, stub_model(Patch,
      :code => "Code",
      :product_batch => nil,
      :ticket_count => 1,
      :pack_no_totals => "Pack No Totals"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/Pack No Totals/)
  end
end
