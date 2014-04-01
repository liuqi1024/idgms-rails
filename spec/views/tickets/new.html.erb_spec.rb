require 'spec_helper'

describe "tickets/new" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :ticket_no => "MyString",
      :game => nil,
      :game_group => nil
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tickets_path, "post" do
      assert_select "input#ticket_ticket_no[name=?]", "ticket[ticket_no]"
      assert_select "input#ticket_game[name=?]", "ticket[game]"
      assert_select "input#ticket_game_group[name=?]", "ticket[game_group]"
    end
  end
end
