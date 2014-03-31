require 'spec_helper'

describe "games/show" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :code => "Code",
      :name => "Name",
      :version => "Version",
      :status => "Status",
      :desc => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/Version/)
    rendered.should match(/Status/)
    rendered.should match(/MyText/)
  end
end
