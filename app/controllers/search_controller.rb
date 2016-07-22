class SearchController < ApplicationController
  def search
    # @search_results = Pokemon.fuzzy_search({number: params[:search_input], name: params[:search_input], element: params[:search_input]})
    # @search_results = Pokemon.fuzzy_search(name: params[:search_input])
    @search_results = Pokemon.fuzzy_search(name: params[:search_input])
    @search_results2 = Pokemon.fuzzy_search(element: params[:search_input])
    @search_results3 = Pokemon.fuzzy_search(number: params[:search_input])
    render 'search/search.html.erb'
  end

end
