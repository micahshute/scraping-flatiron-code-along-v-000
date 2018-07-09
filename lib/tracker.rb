module Tracker
  ALL = []

  def all
    ALL
  end

  def initialize
    ALL.push(self)
  end

  def reset_all
    ALL.clear
  end

end
