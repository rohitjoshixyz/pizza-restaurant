require 'rails_helper'

RSpec.describe "toppings/index", type: :view do
  before(:each) do
    assign(:toppings, [
      Topping.create!(
        name: "Name",
        veg: false
      ),
      Topping.create!(
        name: "Name",
        veg: false
      )
    ])
  end

  it "renders a list of toppings" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
