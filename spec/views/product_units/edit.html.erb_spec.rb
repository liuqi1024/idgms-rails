require 'spec_helper'

describe "product_units/edit" do
  before(:each) do
    @product_unit = assign(:product_unit, stub_model(ProductUnit,
      :game => nil,
      :product_batch => nil,
      :code => "MyString"
    ))
  end

  it "renders the edit product_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_unit_path(@product_unit), "post" do
      assert_select "input#product_unit_game[name=?]", "product_unit[game]"
      assert_select "input#product_unit_product_batch[name=?]", "product_unit[product_batch]"
      assert_select "input#product_unit_code[name=?]", "product_unit[code]"
    end
  end
end
