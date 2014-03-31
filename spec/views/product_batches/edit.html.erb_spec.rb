require 'spec_helper'

describe "product_batches/edit" do
  before(:each) do
    @product_batch = assign(:product_batch, stub_model(ProductBatch,
      :worksheet => nil,
      :code => "MyString"
    ))
  end

  it "renders the edit product_batch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_batch_path(@product_batch), "post" do
      assert_select "input#product_batch_worksheet[name=?]", "product_batch[worksheet]"
      assert_select "input#product_batch_code[name=?]", "product_batch[code]"
    end
  end
end
