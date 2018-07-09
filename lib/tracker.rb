module Tracker
  module Class
    ALL = []

    def all
      ALL
    end

    def reset_all
      ALL.clear
    end
  end
  module Instance
    def initialize
      ALL.push(self)
    end
  end

end
