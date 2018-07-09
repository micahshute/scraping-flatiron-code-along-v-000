require_relative 'tracker'

class Course
  extend Tracker
  attr_accessor :title, :schedule, :description


end
