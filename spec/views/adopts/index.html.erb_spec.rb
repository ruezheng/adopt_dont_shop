require 'rails_helper'

RSpec.describe "adopts/index", type: :view do
  before(:each) do
    assign(:adopts, [
      Adopt.create!(
        title: "Title",
        body: "MyText"
      ),
      Adopt.create!(
        title: "Title",
        body: "MyText"
      )
    ])
  end

  it "renders a list of adopts" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
