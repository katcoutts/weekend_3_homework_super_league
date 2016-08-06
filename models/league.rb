require('pg')
require('table_print')
require_relative('match')
require_relative('team')
require('pry-byebug')

class League

  attr_accessor :matches, :teams

    def initialize(matches,teams)
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

   def team_info
    result = []
    @teams.each do |team|
      result << {name: team.name, points: team.league_points}
    end
    return result
  end

    # So like, find the team in league.teams, then do what you’ve written.

# This doesn't pass but Zsolt says it doesn't matter.
    def team_wins(team)
      wins = 0
      team.matches.each do |match|
        if match.winner.name == team.name
          wins += 1
      end
    end 
    return wins
    end

  def team_points(team)
    points = (team.wins.count * 2) + (team.draws.count)
    return points
  end

  def team_winning_games(team)
    wins = []
    team.matches.each do |match| 
      if match.winner_id == team.id
        wins << match
      end
    end
  return wins
  end


# not working
  # def match_winner(match)
  #   match.winner_id
  #   teams.each do |team|
  #     if team.id == match.winner_id
  #     team = Team.new    
  #   end
  # end
  # return team
  # end



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

  def team_positions()
    team_points = []
    @teams.each do |team|
      team_points << ({name: team.name, points: team.league_points})
    end
    sorted = team_points.sort_by { |k| k[:points]}
    return sorted.reverse
  end

  def league_topper()
    team_positions.first
  end

  def league_table_info()
    league_table = []
    @teams.each do |team|
      league_table << ({name: team.name, wins: team.wins.count, losses: team.losses.count, draws: team.draws.count, points_for: team.total_points_scored, points_against: team.total_points_conceded, points_difference: team.points_difference, league_points: team.league_points})
      end
    sorted = league_table.sort_by { |k| k[:league_points]}
    return sorted.reverse
  end

  def print_table
    tp league_table_info
  end

  def rank_teams_by_attack
    attack_table = []
    @teams.each do |team|
      attack_table << ({name: team.name, points_for: team.total_points_scored, ave_points_scored: team.ave_points_scored})
    end
    sorted = attack_table.sort_by {|k| k[:ave_points_scored]}
    tp sorted.reverse
  end

  def rank_teams_by_defence
    defence_table = []
    @teams.each do |team|
      defence_table << ({name: team.name, points_conceded: team.total_points_conceded, ave_points_conceded: team.ave_points_conceded})
    end
    sorted = defence_table.sort_by {|k| k[:ave_points_conceded]}
    tp sorted
  end


end 


