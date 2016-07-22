require "rails_helper"

RSpec.describe PokemonsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pokemons").to route_to("pokemons#index")
    end

    it "routes to #new" do
      expect(:get => "/pokemons/new").to route_to("pokemons#new")
    end

    it "routes to #show" do
      expect(:get => "/pokemons/1").to route_to("pokemons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pokemons/1/edit").to route_to("pokemons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pokemons").to route_to("pokemons#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pokemons/1").to route_to("pokemons#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pokemons/1").to route_to("pokemons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pokemons/1").to route_to("pokemons#destroy", :id => "1")
    end

  end
end
