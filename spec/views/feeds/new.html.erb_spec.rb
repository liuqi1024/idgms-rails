require 'spec_helper'

describe "feeds/new" do
  before(:each) do
    assign(:feed, stub_model(Feed,
      :owner_type => "MyString",
      :owner_id => 1,
      :user_id => 1,
      :operation => "MyString",
      :desc => "MyText"
    ).as_new_record)
  end

  it "renders new feed form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feeds_path, "post" do
      assert_select "input#feed_owner_type[name=?]", "feed[owner_type]"
      assert_select "input#feed_owner_id[name=?]", "feed[owner_id]"
      assert_select "input#feed_user_id[name=?]", "feed[user_id]"
      assert_select "input#feed_operation[name=?]", "feed[operation]"
      assert_select "textarea#feed_desc[name=?]", "feed[desc]"
    end
  end
end
