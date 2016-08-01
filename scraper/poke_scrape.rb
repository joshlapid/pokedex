require 'nokogiri'
require 'mechanize'




file = File.open('bulbasaur.html')
html = Nokogiri::HTML(file)

output = File.new('bulbasaur-data.txt', 'w+')

description = html.at_css(".version-descriptions").text

puts description
