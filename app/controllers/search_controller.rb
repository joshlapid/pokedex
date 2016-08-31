class SearchController < ApplicationController
  def search
    @pokemon_all = Pokemon.all
    # Searches for pokemon by name
    # Searches for pokemon by element
    @search_results_element = Pokemon.fuzzy_search(element: params[:search_input])

    if !params[:search_input].nil?
      if params[:search_input].length == 1
        # Searches for pokemon by first letter
        @search_results = Pokemon.where('substr(name, 1, 1) = ? OR substr(name, 1, 1) = ?', params[:search_input].upcase, params[:search_input].downcase)

      # Searches for pokemon by first 2 letters
      elsif params[:search_input].length == 2
        @search_results = Pokemon.where('substr(name, 1, 2) = ? OR substr(name, 1, 2) = ?', params[:search_input], params[:search_input].capitalize)

      # Searches for pokemon by first 3 letters
      elsif params[:search_input].length == 3
        @search_results = Pokemon.where('substr(name, 1, 3) = ? OR substr(name, 1, 3) = ?', params[:search_input], params[:search_input].capitalize)
      else
        @search_results = Pokemon.fuzzy_search(name: params[:search_input])
      end
    end


      if params[:search_input].nil?
        @pokemon_all = Pokemon.all
      end

    render 'search/search.html.erb'
  end

  def all
    @pokemon_all = Pokemon.all
  end

end
