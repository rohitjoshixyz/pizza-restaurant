require 'rails_helper'

RSpec.describe "toppings/edit", type: :view do
  before(:each) do
    @topping = assign(:topping, Topping.create!(
      name: "MyString",
      veg: false
    ))
  end

  it "renders the edit topping form" do
    render

    assert_select "form[action=?][method=?]", topping_path(@topping), "post" do

      assert_select "input[name=?]", "topping[name]"

      assert_select "input[name=?]", "topping[veg]"
    end
  end
end
