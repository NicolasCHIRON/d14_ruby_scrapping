require 'nokogiri'
require 'open-uri'

# Pour aller chercher l'adresse mail sur la page d'une commune
def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  return page.xpath("//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end

# Pour aller chercher les urls de toutes les communes du 9-5
def get_townhall_urls
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
  array_town_url = []
  array_town_name = page.xpath("//p/a")
  array_town_name.each do |town_url|
    array_town_url << "http://annuaire-des-mairies.com" + town_url["href"][1..-1].to_s
  end  
  return array_town_url
end

# Fait une petite boucle pour faire correspondre chaque url à l'adresse mail correspondante
def perform(array_url_townhall)
  array_town_email = []  
  get_townhall_urls.each do |town_url|
  array_town_email << get_townhall_email(town_url)
  end
  return array_town_email
end

puts perform(get_townhall_urls)