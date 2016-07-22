class SearchController < ApplicationController
  def search
    # Searches for pokemon by name
    @search_results_name = Pokemon.fuzzy_search(name: params[:search_input])
    # Searches for pokemon by element
    @search_results_element = Pokemon.fuzzy_search(element: params[:search_input])
    # Searches for pokemon by description
    @search_results_description = Pokemon.fuzzy_search(description: params[:search_input])
    # Searches for pokemon by first letter
    @search_results_first_letter = Pokemon.where('substr(name, 1, 1) = ? OR substr(name, 1, 1) = ?', params[:search_input].upcase, params[:search_input].downcase)
    # Searches for pokemon by first two letters
    @search_results_two_letter = Pokemon.where('substr(name, 1, 2) = ? OR substr(name, 1, 2) = ?', params[:search_input], params[:search_input].capitalize)
  end

end
