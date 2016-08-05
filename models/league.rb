require('pg')
require_relative('match')
require_relative('team')

class League

    def initialize(matches, teams)
      @matches = matches
      @teams = teams
    end

    def total_points()
      total = 0
      @matches.each do |match| 
        total = total + match.away_team_score + match.home_team_score
      end
      total
    end

    def home_points()
    end

    def away_points()
    end

    def home_wins()
    end

    def away_wins()
    end

    def draws()
    end

    def team_points()
    end




    

end 


