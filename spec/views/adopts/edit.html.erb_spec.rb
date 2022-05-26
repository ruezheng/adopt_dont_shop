require 'rails_helper'

RSpec.describe "adopts/edit", type: :view do
  before(:each) do
    @adopt = assign(:adopt, Adopt.create!(
      title: "MyString",
      body: "MyText"
    ))
  end

  it "renders the edit adopt form" do
    render

    assert_select "form[action=?][method=?]", adopt_path(@adopt), "post" do

      assert_select "input[name=?]", "adopt[title]"

      assert_select "textarea[name=?]", "adopt[body]"
    end
  end
end
