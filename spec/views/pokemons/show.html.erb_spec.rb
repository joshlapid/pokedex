require 'rails_helper'

RSpec.describe "pokemons/show", type: :view do
  before(:each) do
    @pokemon = assign(:pokemon, Pokemon.create!(
      :number => 1,
      :name => "Name",
      :element => "Element",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Element/)
    expect(rendered).to match(/Description/)
  end
end
