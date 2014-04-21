require 'spec_helper'

describe "feeds/show" do
  before(:each) do
    @feed = assign(:feed, stub_model(Feed,
      :owner_type => "Owner Type",
      :owner_id => 1,
      :user_id => 2,
      :operation => "Operation",
      :desc => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Owner Type/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Operation/)
    rendered.should match(/MyText/)
  end
end
