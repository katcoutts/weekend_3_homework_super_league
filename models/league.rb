require('pg')
require_relative('match')
require_relative('team')

class League

  attr_accessor :matches, :teams

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

    def home_team_points()
      total = 0
      @matches.each do |match| 
        total = total + match.home_team_score
      end
      total
    end

    def away_team_points()
      total = 0
      @matches.each do |match| 
        total = total + match.away_team_score 
      end
      total
    end

    def count_home_wins()
      home_wins = 0
      @matches.each do |match|
        if match.home_team_score > match.away_team_score
          home_wins += 1
        end
      end
      return home_wins
    end

    def count_away_wins()
      away_wins = 0
      @matches.each do |match|
        if match.away_team_score > match.home_team_score
          away_wins += 1
        end
      end
      return away_wins
    end

    def count_draws()
      draws = 0
      @matches.each do |match| 
        if match.home_team_score == match.away_team_score
          draws += 1
        end
      end
      return draws
    end

# This doesn't pass but Zsolt says it doesn't matter.
    # def team_wins(team)
    #   wins = 0
    #   @matches.each do |match|
    #     if match.winner == team
    #       wins += 1
    #   end
    # end 
    # return wins
    # end

    # def team_wins(team)
    #   wins = 0
    #   team.matches.each do |match|
    #     if match.winner == team
    #       wins += 1
    #   end
    # end 
    # return wins
    # end

    # def team_points_diff(team)
    # end




    

end 


