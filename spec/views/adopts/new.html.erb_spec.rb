require 'rails_helper'

RSpec.describe "adopts/new", type: :view do
  before(:each) do
    assign(:adopt, Adopt.new(
      title: "MyString",
      body: "MyText"
    ))
  end

  it "renders new adopt form" do
    render

    assert_select "form[action=?][method=?]", adopts_path, "post" do

      assert_select "input[name=?]", "adopt[title]"

      assert_select "textarea[name=?]", "adopt[body]"
    end
  end
end
