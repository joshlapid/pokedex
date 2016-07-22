require 'rails_helper'

RSpec.describe "pokemons/index", type: :view do
  before(:each) do
    assign(:pokemons, [
      Pokemon.create!(
        :number => 1,
        :name => "Name",
        :element => "Element",
        :description => "Description"
      ),
      Pokemon.create!(
        :number => 1,
        :name => "Name",
        :element => "Element",
        :description => "Description"
      )
    ])
  end

  it "renders a list of pokemons" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Element".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
