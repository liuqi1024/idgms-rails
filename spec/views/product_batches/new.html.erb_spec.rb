require 'spec_helper'

describe "product_batches/new" do
  before(:each) do
    assign(:product_batch, stub_model(ProductBatch,
      :worksheet => nil,
      :code => "MyString"
    ).as_new_record)
  end

  it "renders new product_batch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_batches_path, "post" do
      assert_select "input#product_batch_worksheet[name=?]", "product_batch[worksheet]"
      assert_select "input#product_batch_code[name=?]", "product_batch[code]"
    end
  end
end
