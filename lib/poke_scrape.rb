class PokemonScraper
  require 'mechanize'
  # require_relative '../app/models/pokemon.rb'

  def scrape
    pokemon_names = ['Ivysaur', 'Dragonite', 'Charmander']

    agent = Mechanize.new { |agent|
      agent.user_agent_alias = 'Linux Firefox'
    }

    pokemon_names.each do |name|
      page = agent.get('http://www.pokemon.com/us/pokedex/' + name)
      html_pokemon = Nokogiri::HTML(page.body)
      number = html_pokemon.at_css('#pokemonID').text
      type1 = html_pokemon.xpath('//div[@class="dtm-type"]/ul/li/a')[0].text
      if html_pokemon.xpath('//div[@class="dtm-ty`pe"]/ul/li/a')[1] != nil
        type2 = html_pokemon.xpath('//div[@class="dtm-type"]/ul/li/a')[1].text
      end
      description = html_pokemon.at_xpath('//div/p')
      puts number
      puts type1
      if type2 != nil
        puts type2
      end
      puts name + ":" + description

      Pokemon.create(name: name)
    end
  end

end
