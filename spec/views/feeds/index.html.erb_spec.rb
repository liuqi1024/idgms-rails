require 'spec_helper'

describe "feeds/index" do
  before(:each) do
    assign(:feeds, [
      stub_model(Feed,
        :owner_type => "Owner Type",
        :owner_id => 1,
        :user_id => 2,
        :operation => "Operation",
        :desc => "MyText"
      ),
      stub_model(Feed,
        :owner_type => "Owner Type",
        :owner_id => 1,
        :user_id => 2,
        :operation => "Operation",
        :desc => "MyText"
      )
    ])
  end

  it "renders a list of feeds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Owner Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Operation".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
