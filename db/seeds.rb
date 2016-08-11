# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



pokemon_names = ['Bulbasaur', 'Ivysaur', 'Venusaur']

agent = Mechanize.new { |agent|
  agent.user_agent_alias = 'Linux Firefox'
}

pokemon_names.each do |name|
  page = agent.get('http://www.pokemon.com/us/pokedex/' + name)
  html_pokemon = Nokogiri::HTML(page.body)
  number = html_pokemon.at_css('#pokemonID').text
  type1 = html_pokemon.xpath('//div[@class="dtm-type"]/ul/li/a')[0].text
  if html_pokemon.xpath('//div[@class="dtm-type"]/ul/li/a')[1] != nil
    type2 = html_pokemon.xpath('//div[@class="dtm-type"]/ul/li/a')[1].text
  end
  description = html_pokemon.at_xpath('//div/p').text
  picture = html_pokemon.at_xpath('//div[@class="profile-images"]/img').attr('src')
  puts number
  puts type1
  if type2 != nil
    type2 = "/" + type2
    puts type2
  else
    type2 = " "
  end
  puts name + ":" + description
  puts picture

  Pokemon.create(index_number: number, name: name, element: type1 + type2, description: description, picture: picture)

  end
