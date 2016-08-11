class AddPictureToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :picture, :string
  end
end
