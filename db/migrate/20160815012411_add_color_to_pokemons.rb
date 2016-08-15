class AddColorToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :color, :string
  end
end
