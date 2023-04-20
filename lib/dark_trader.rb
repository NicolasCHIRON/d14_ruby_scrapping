require 'nokogiri'
require 'open-uri'

def scraping(url)
  page = Nokogiri::HTML(URI.open(url))
  table_cryptos = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr")
  hashes_cryptos = Array.new
  table_cryptos.each do |row|
    hash_crypto = {currency: row.xpath("./td[2]/div/a[2]").text, value: row.xpath("./td[5]/div/a/span").text}
    hashes_cryptos << hash_crypto
  end
  puts hashes
end

scraping('https://coinmarketcap.com/all/views/all/')