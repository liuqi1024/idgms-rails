require 'spec_helper'

describe "transport_batches/edit" do
  before(:each) do
    @transport_batch = assign(:transport_batch, stub_model(TransportBatch,
      :product_batch => nil,
      :code => "MyString"
    ))
  end

  it "renders the edit transport_batch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transport_batch_path(@transport_batch), "post" do
      assert_select "input#transport_batch_product_batch[name=?]", "transport_batch[product_batch]"
      assert_select "input#transport_batch_code[name=?]", "transport_batch[code]"
    end
  end
end
