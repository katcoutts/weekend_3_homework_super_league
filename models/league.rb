# this was ok but any time I tried to do any methods in here that passed in a particular match or team I couldn't get it to pass a test - but I know that when running console.rb the team and match methods I was calling on are all working.

require('pg')
require_relative('match')
require_relative('team')
require('pry-byebug')

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

    def winning_scores()
      winning_scores = []
      @matches.each do |match|
        if match.home_team_score > match.away_team_score
          winning_scores << match.home_team_score
        elsif match.away_team_score > match.home_team_score
          winning_scores << match.away_team_score
        end
      end
      return winning_scores
    end

    def biggest_winning_score()
      biggest_win_score = winning_scores.sort.last
    return biggest_win_score
    end

    def lowest_winning_score()
      lowest_winning_score = winning_scores.sort.first
    return lowest_winning_score
    end

    def average_winning_score
      total_win_scores = winning_scores.inject{ |sum,x| sum + x }
      ave_win_score = (total_win_scores / Match.all.count).to_f
      return ave_win_score.round
    end

    def average_points()
      average = total_points.to_f / (Match.all.count * 2).to_f
      return average.round
    end

    def winning_margins()
      winning_margins = []
      @matches.each do |match|
        difference = match.home_team_score - match.away_team_score
        winning_margins << difference.abs
      end
      return winning_margins
    end

    def ave_winning_margin()
      total_winning_margins = winning_margins.inject{ |sum,x| sum + x }
      ave_win_margin = (total_winning_margins / Match.all.count).to_f
      return ave_win_margin.round
    end

    def total_a_teams_points(team)
      points = 0
      team.matches.each do |match|
        if match.home_team_id == team.id
          points += match.home_team_score
        elsif match.away_team_id == team.id
          points += match.away_team_score
        end
      end
      return points
    end



# This doesn't pass but Zsolt says it doesn't matter.
    # def team_wins(team)
    #   wins = 0
    #   team.matches.each do |match|
    #     if match.winner.name == team.name
    #       wins += 1
    #   end
    # end 
    # return wins
    # end

  # def team_points(team)
  #   points = (team.wins.count * 2) + (team.draws.count)
  #   return points
  # end

  # def team_wins(team)
  #   wins = []
  #   team.matches.each do |match| 
  #     if match.winner_id == team.id
  #       wins << match
  #     end
  #   end
  # return wins
  # end

  # def match_winner(match)
  #   @match.winner_id
  #   teams.each do |team|
  #     if team_id == @match.winner_id
  #     team = Team.new
  #     return team
  #   end
  # end
  # end

  # def get_teams_no_of_wins(team)
  #   wins = 0
  #   team.matches.each do |match|
  #     if match.winner_id == team.id
  #       wins += 1
  #     end
  #   end
  #   return wins
  # end 


end 


