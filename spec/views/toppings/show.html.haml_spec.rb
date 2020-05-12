require 'rails_helper'

RSpec.describe "toppings/show", type: :view do
  before(:each) do
    @topping = assign(:topping, Topping.create!(
      name: "Name",
      veg: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
  end
end
