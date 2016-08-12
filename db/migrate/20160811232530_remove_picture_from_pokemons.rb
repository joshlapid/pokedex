class RemovePictureFromPokemons < ActiveRecord::Migration
  def change
    remove_column :pokemons, :picture, :string
    remove_column :pokemons, :string, :string
  end
end
