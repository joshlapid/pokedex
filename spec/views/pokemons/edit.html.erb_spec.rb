require 'rails_helper'

RSpec.describe "pokemons/edit", type: :view do
  before(:each) do
    @pokemon = assign(:pokemon, Pokemon.create!(
      :number => 1,
      :name => "MyString",
      :element => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit pokemon form" do
    render

    assert_select "form[action=?][method=?]", pokemon_path(@pokemon), "post" do

      assert_select "input#pokemon_number[name=?]", "pokemon[number]"

      assert_select "input#pokemon_name[name=?]", "pokemon[name]"

      assert_select "input#pokemon_element[name=?]", "pokemon[element]"

      assert_select "input#pokemon_description[name=?]", "pokemon[description]"
    end
  end
end
