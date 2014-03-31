require 'spec_helper'

describe "game_groups/index" do
  before(:each) do
    assign(:game_groups, [
      stub_model(GameGroup,
        :game => nil,
        :torrent => "Torrent",
        :serial_no => "Serial No"
      ),
      stub_model(GameGroup,
        :game => nil,
        :torrent => "Torrent",
        :serial_no => "Serial No"
      )
    ])
  end

  it "renders a list of game_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Torrent".to_s, :count => 2
    assert_select "tr>td", :text => "Serial No".to_s, :count => 2
  end
end
