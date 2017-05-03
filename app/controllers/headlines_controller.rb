class HeadlinesController < ApplicationController
  def index
    @headlines = Headline.limit(25).order(created_at: :desc)
  end

  def scrape
    require 'open-uri'
    doc = Nokogiri::HTML(open("https://www.washingtonpost.com/"))
    entries = doc.css('.headline')
    @first = entries.css('a')[0].text

    hl = Headline.new
    hl.title = @first
    hl.save
  end
end
