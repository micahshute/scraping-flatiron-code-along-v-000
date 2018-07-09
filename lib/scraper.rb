require 'nokogiri'
require 'open-uri'
require_relative './course.rb'
require 'pry'

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
    doc.css("article")
  end

  def make_courses
    courses_raw = get_courses
    courses = courses_raw.map do |raw|
      course = Course.new
      course.title = raw.css("h2").text
      course.description = raw.css("p").text
      course.schedule = raw.css(".date").text
      binding.pry
    end
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
