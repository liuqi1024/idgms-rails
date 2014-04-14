require 'spec_helper'

describe "patches/edit" do
  before(:each) do
    @patch = assign(:patch, stub_model(Patch,
      :code => "MyString",
      :product_batch => nil,
      :ticket_count => 1,
      :pack_no_totals => "MyString"
    ))
  end

  it "renders the edit patch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", patch_path(@patch), "post" do
      assert_select "input#patch_code[name=?]", "patch[code]"
      assert_select "input#patch_product_batch[name=?]", "patch[product_batch]"
      assert_select "input#patch_ticket_count[name=?]", "patch[ticket_count]"
      assert_select "input#patch_pack_no_totals[name=?]", "patch[pack_no_totals]"
    end
  end
end
