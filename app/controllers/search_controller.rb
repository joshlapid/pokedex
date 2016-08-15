class SearchController < ApplicationController
  def search
    # Searches for pokemon by name
    @search_results_name = Pokemon.fuzzy_search(name: params[:search_input])
    # Searches for pokemon by element
    @search_results_element = Pokemon.fuzzy_search(element: params[:search_input])

    if !params[:search_input].nil?
      # Searches for pokemon by first letter
      @search_results_first_letter = Pokemon.where('substr(name, 1, 1) = ? OR substr(name, 1, 1) = ?', params[:search_input].upcase, params[:search_input].downcase)
    end
      # Searches for pokemon by first two letters

    if !params[:search_input].nil?
      @search_results_two_letter = Pokemon.where('substr(name, 1, 2) = ? OR substr(name, 1, 2) = ?', params[:search_input], params[:search_input].capitalize)
    end

    if params[:search_input].nil?
      @pokemon_all = Pokemon.all
    end

    render 'search/search.html.erb'
  end

end
