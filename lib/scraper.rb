require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './course.rb'

class Scraper

  attr_accessor :url

  def initialize(url = "http://learn-co-curriculum.github.io/site-for-scraping/courses")
    @url = url

  end

  def get_page
    Nokogiri::HTML(open(@url))
  end

  def get_courses
    doc = get_page
    data = doc.css("article.post same-height-left h2")
    text = data.text
    binding.pry
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
