require 'spec_helper'

describe "games/edit" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :code => "MyString",
      :name => "MyString",
      :version => "MyString",
      :status => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders the edit game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", game_path(@game), "post" do
      assert_select "input#game_code[name=?]", "game[code]"
      assert_select "input#game_name[name=?]", "game[name]"
      assert_select "input#game_version[name=?]", "game[version]"
      assert_select "input#game_status[name=?]", "game[status]"
      assert_select "textarea#game_desc[name=?]", "game[desc]"
    end
  end
end
