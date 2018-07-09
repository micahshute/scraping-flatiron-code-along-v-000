require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  attr_accessor :url, :doc

  def initialize(url = "http://learn-co-curriculum.github.io/site-for-scraping/courses")
    @url = url
    @doc = Nokogiri::HTML(open(@url))
  end
  
  def get_page
    open(self.url)
  end
  
    def print_courses
      self.make_courses
      Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end



