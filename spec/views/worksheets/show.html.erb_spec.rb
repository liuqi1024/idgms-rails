require 'spec_helper'

describe "worksheets/show" do
  before(:each) do
    @worksheet = assign(:worksheet, stub_model(Worksheet,
      :game => nil,
      :printbatch => "Printbatch",
      :desc => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Printbatch/)
    rendered.should match(/MyText/)
  end
end
