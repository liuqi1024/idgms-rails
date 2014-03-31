require 'spec_helper'

describe "game_groups/new" do
  before(:each) do
    assign(:game_group, stub_model(GameGroup,
      :game => nil,
      :torrent => "MyString",
      :serial_no => "MyString"
    ).as_new_record)
  end

  it "renders new game_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", game_groups_path, "post" do
      assert_select "input#game_group_game[name=?]", "game_group[game]"
      assert_select "input#game_group_torrent[name=?]", "game_group[torrent]"
      assert_select "input#game_group_serial_no[name=?]", "game_group[serial_no]"
    end
  end
end
