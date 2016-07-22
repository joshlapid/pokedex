class SearchController < ApplicationController
  def search
    @search_results_name = Pokemon.fuzzy_search(name: params[:search_input])
    @search_results_element = Pokemon.fuzzy_search(element: params[:search_input])
    @search_results_description = Pokemon.fuzzy_search(description: params[:search_input])
    render 'search/search.html.erb'
  end

end
