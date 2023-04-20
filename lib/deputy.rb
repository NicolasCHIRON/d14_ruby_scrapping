require 'nokogiri'
require 'open-uri'

# Pour faire un tableau des prénoms
def deputy_first_name
  page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  array_names = page.xpath('//a[starts-with(@href,"/deputes/fiche")]')
  deputy_first_name = []
  array_names.each do |link|
    first_name = link.to_s[0..-5].split('>')[1].split[1]
    first_name
    deputy_first_name << first_name
  end
  return deputy_first_name
end

# Pour faire un tableau des noms de famille
def deputy_last_name
  page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  array_names = page.xpath('//a[starts-with(@href,"/deputes/fiche")]')
  deputy_last_name = []
  array_names.each do |link|
    last_name = link.to_s[0..-5].split('>')[1].split[2]
    last_name
    deputy_last_name << last_name
  end
  return deputy_last_name
end

# Pour faire un tableau des urls
def deputy_url
  page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  deputy_numbers = []
  deputy_links =  page.xpath('//a[starts-with(@href,"/deputes/fiche")]')
  deputy_links.each do |deputy_links|
    deputy_number = deputy_links.to_s.split('_')[1].split(/"/)[0]
    deputy_number = "https://www.assemblee-nationale.fr/dyn/deputes/" + deputy_number
    deputy_numbers << deputy_number
  end
  return deputy_numbers
end

# On se sert des urls pour faire un tableau de mails
def deputy_email(url)
  deputy_emails = []
  url.each do |link|
    page = Nokogiri::HTML(URI.open(link))
    deputy_email = page.xpath('//*[@id="main"]/div/div/div/section[2]/div/ul/li[1]/a/span[2]').text
    deputy_emails << deputy_email
  end
  return deputy_emails
end

# Et là on lui demande de tout regrouper, donc ça va chercher 325580 fois des informations et on time out comme des cons !
def perform(first_name, last_name, emails)
  first_name = deputy_first_name
  last_name = deputy_last_name
  email = deputy_email
  first_name.zip(last_name, email).map {|f, l, e| {first_name => f, last_name => l, email => e}}
end

return perform(deputy_first_name, deputy_last_name,deputy_email(deputy_url))