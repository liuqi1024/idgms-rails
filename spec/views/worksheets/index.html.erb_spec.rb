require 'spec_helper'

describe "worksheets/index" do
  before(:each) do
    assign(:worksheets, [
      stub_model(Worksheet,
        :game => nil,
        :printbatch => "Printbatch",
        :desc => "MyText"
      ),
      stub_model(Worksheet,
        :game => nil,
        :printbatch => "Printbatch",
        :desc => "MyText"
      )
    ])
  end

  it "renders a list of worksheets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Printbatch".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
