require 'spec_helper'

describe "product_units/new" do
  before(:each) do
    assign(:product_unit, stub_model(ProductUnit,
      :game => nil,
      :product_batch => nil,
      :code => "MyString"
    ).as_new_record)
  end

  it "renders new product_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_units_path, "post" do
      assert_select "input#product_unit_game[name=?]", "product_unit[game]"
      assert_select "input#product_unit_product_batch[name=?]", "product_unit[product_batch]"
      assert_select "input#product_unit_code[name=?]", "product_unit[code]"
    end
  end
end
