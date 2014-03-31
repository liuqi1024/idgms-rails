require 'spec_helper'

describe "worksheets/new" do
  before(:each) do
    assign(:worksheet, stub_model(Worksheet,
      :game => nil,
      :printbatch => "MyString",
      :desc => "MyText"
    ).as_new_record)
  end

  it "renders new worksheet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", worksheets_path, "post" do
      assert_select "input#worksheet_game[name=?]", "worksheet[game]"
      assert_select "input#worksheet_printbatch[name=?]", "worksheet[printbatch]"
      assert_select "textarea#worksheet_desc[name=?]", "worksheet[desc]"
    end
  end
end
