class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.integer :number
      t.string :name
      t.string :element
      t.string :description

      t.timestamps null: false
    end
  end
end
