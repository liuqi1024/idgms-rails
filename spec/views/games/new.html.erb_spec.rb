require 'spec_helper'

describe "games/new" do
  before(:each) do
    assign(:game, stub_model(Game,
      :code => "MyString",
      :name => "MyString",
      :version => "MyString",
      :status => "MyString",
      :desc => "MyText"
    ).as_new_record)
  end

  it "renders new game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", games_path, "post" do
      assert_select "input#game_code[name=?]", "game[code]"
      assert_select "input#game_name[name=?]", "game[name]"
      assert_select "input#game_version[name=?]", "game[version]"
      assert_select "input#game_status[name=?]", "game[status]"
      assert_select "textarea#game_desc[name=?]", "game[desc]"
    end
  end
end
