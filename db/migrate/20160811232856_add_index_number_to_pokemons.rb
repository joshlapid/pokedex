class AddIndexNumberToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :index_number, :string
  end
end
