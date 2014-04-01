require 'spec_helper'

describe "tickets/show" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :ticket_no => "Ticket No",
      :game => nil,
      :game_group => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ticket No/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
