require 'nokogiri'
require 'open-uri'
require 'pry'
require 'net/http'

class Scraper
  def initialize
    scrape_data
  end

  def scrape_data
    alaska_url = "http://museumsusa.org/museums/?k=1271400%2cState%3aAK"

    begin
      @html = URI.open(alaska_url)
    rescue StandardError => e
      puts "Error opening URL: #{e}"
    end
    @doc = Nokogiri::HTML(@html)
    cities =  @doc.css('div.ui.attached.segment:nth-of-type(2)').css('table')
    binding.pry
  end
end

scrape = Scraper.new
