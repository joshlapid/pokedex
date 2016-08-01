require 'mechanize'

pokemon_names = ['Bulbasaur', 'Ivysaur', 'Venusaur']

agent = Mechanize.new { |agent|
  agent.user_agent_alias = 'Linux Firefox'
}

page = agent.get('http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_index_number_(Generation_I)')

pokemon_names.each do |name|
  pokemon = page.links_with(:text => name).first.click
  html_pokemon = Nokogiri::HTML(pokemon.body)
  description = html_pokemon.at_xpath('//td[@rowspan="2"]').text
  puts name + ":" + description
end
