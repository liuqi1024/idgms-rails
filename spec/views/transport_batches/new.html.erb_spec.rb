require 'spec_helper'

describe "transport_batches/new" do
  before(:each) do
    assign(:transport_batch, stub_model(TransportBatch,
      :product_batch => nil,
      :code => "MyString"
    ).as_new_record)
  end

  it "renders new transport_batch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transport_batches_path, "post" do
      assert_select "input#transport_batch_product_batch[name=?]", "transport_batch[product_batch]"
      assert_select "input#transport_batch_code[name=?]", "transport_batch[code]"
    end
  end
end
