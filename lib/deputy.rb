require 'nokogiri'
require 'open-uri'


def deputy_first_name
  page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  page.xpath('//a[starts-with(@href,"/deputes/fiche")]')
  array_names.each do |link|
    puts first_name = link.split('.',-1)[1]
  end
end

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

def deputy_email(url)
  deputy_emails = []
  url.each do |link|
    page = Nokogiri::HTML(URI.open(link))
    deputy_email = page.xpath('//*[@id="main"]/div/div/div/section[2]/div/ul/li[1]/a/span[2]').text
    deputy_emails << deputy_email
  end
  return deputy_emails
end

puts deputy_first_name
# print deputy_email(deputy_url)
# #https://www.assemblee-nationale.fr/dyn/deputes/PA605036

# # puts hash_deputy = { first_name :'<a href="/deputes/fiche/OMC_PA793572">M. Christophe Plassard</a>'[0..-5].split('.',-1)[1] ; last_name : } 

# '<a href="/deputes/fiche/OMC_PA793572">M. Christophe Plassard</a>'[0..-5].split('.',-1)[1]
# '<a href="/deputes/fiche/OMC_PA793572">M. Christophe Plassard</a>'[0..-5].split('.',-1)[1]
