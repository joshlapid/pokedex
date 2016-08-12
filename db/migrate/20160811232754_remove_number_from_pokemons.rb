class RemoveNumberFromPokemons < ActiveRecord::Migration
  def change
    remove_column :pokemons, :number, :integer
  end
end
