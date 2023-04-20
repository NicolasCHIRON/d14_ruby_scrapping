require 'nokogiri'
require 'open-uri'

def currencies
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  cryptos = page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr')
  array_cryptos = []
  cryptos.each do |crypto|
    crypto = crypto.xpath("./td[2]/div/a[2]").text
    array_cryptos << crypto
  end
  array_cryptos
end

def values
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  values = page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr')
  array_values = []
  values.each do |value|
    value = value.xpath("./td[5]/div/a/span").text
    array_values << value
  end
  array_values
end

def scraping(currencies,values)
  return hash = Hash[currencies.zip(values)]
end