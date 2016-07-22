json.extract! pokemon, :id, :number, :name, :element, :description, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)