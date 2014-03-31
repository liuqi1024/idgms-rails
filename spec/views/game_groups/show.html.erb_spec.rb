require 'spec_helper'

describe "game_groups/show" do
  before(:each) do
    @game_group = assign(:game_group, stub_model(GameGroup,
      :game => nil,
      :torrent => "Torrent",
      :serial_no => "Serial No"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Torrent/)
    rendered.should match(/Serial No/)
  end
end
