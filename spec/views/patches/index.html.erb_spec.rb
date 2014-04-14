require 'spec_helper'

describe "patches/index" do
  before(:each) do
    assign(:patches, [
      stub_model(Patch,
        :code => "Code",
        :product_batch => nil,
        :ticket_count => 1,
        :pack_no_totals => "Pack No Totals"
      ),
      stub_model(Patch,
        :code => "Code",
        :product_batch => nil,
        :ticket_count => 1,
        :pack_no_totals => "Pack No Totals"
      )
    ])
  end

  it "renders a list of patches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Pack No Totals".to_s, :count => 2
  end
end
