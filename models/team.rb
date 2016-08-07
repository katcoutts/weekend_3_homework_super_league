require('pg')
require_relative('../db/sql_runner')

class Team

  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end


  def self.all
    sql = "SELECT * FROM teams"
    teams = SqlRunner.run(sql)
    result = teams.map {|team| Team.new(team)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ('#{ @name }') RETURNING *"
    team = SqlRunner.run( sql ).first
    @id = team['id'].to_i
  end

  def update()
    sql = "UPDATE teams SET
    name = '#{ @name }'
    WHERE id = #{ @id };"
    SqlRunner.run(sql)
    return self
  end


  def delete()
    sql = "DELETE FROM teams WHERE  
    id = #{@id};"
    SqlRunner.run( sql )
  end



  # def wins()
  #   wins = []
  #   matches.each do |match|
  #     if match.winner != nil && match.winner.name == @name
  #     wins << match
  #     end
  #   end
  #   return wins
  # end

  def wins()
    wins = []
    matches.each do |match|
      if match.winner_id == @id
        wins << match
      end
    end
    return wins
  end

  def win_percentage()
    result = (wins.count.to_f / matches.count.to_f) * 100
    return result.round(2)
  end

  def losses()
    losses = []
    matches.each do |match|
      if match.winner != nil && match.winner.name != @name
        losses << match
      end
    end
    return losses
  end

  def draws()
    draws = []
    matches.each do |match|
      if match.winner == nil
        draws << match
      end
    end
    return draws
  end


  # def matches()
  #   away_matches() + home_matches() 
  # end

  def matches()
    sql = "SELECT matches.* FROM matches WHERE away_team_id = #{@id} OR home_team_id = #{@id};"
    matches = SqlRunner.run( sql )
    result = matches.map { |match| Match.new(match) }
    return result
  end


  def home_matches()
    home_matches = []
    matches.each do |match|
      if match.home_team_id == @id
        home_matches << match
      end
    end
    return home_matches
  end


  def away_matches()
    away_matches = []
    matches.each do |match|
      if match.away_team_id == @id
        away_matches << match
      end
    end
    return away_matches
  end

  # def home_matches()
  #   sql = "SELECT matches.* FROM matches WHERE home_team_id = #{@id};"
  #   home_matches = SqlRunner.run( sql )
  #   result = home_matches.map { |match| Match.new(match) }
  #   return result
  # end

  # def away_matches()
  #   sql = "SELECT matches.* FROM matches WHERE away_team_id = #{@id};"
  #   away_matches = SqlRunner.run( sql )
  #   result = away_matches.map { |match| Match.new(match) }
  #   return result
  # end

  def league_points()
    points = (wins.count * 2) + draws.count
    return points
  end
  
  def total_points_scored()
    points = 0
    matches.each do |match|
      if match.home_team_id == @id
        points += match.home_team_score
      elsif match.away_team_id == @id
        points += match.away_team_score
      end
    end
    return points
  end 

  def total_points_conceded()
    points = 0
    matches.each do |match|
      if match.home_team_id == @id
        points += match.away_team_score
      elsif match.away_team_id == @id
        points += match.home_team_score
      end
    end
    return points
  end 

  def ave_points_conceded()
    result = total_points_conceded.to_f / matches.count.to_f
    return result.round(0)
  end

  def ave_points_scored()
    result = total_points_scored.to_f / matches.count.to_f
    return result.round(0)
  end

  def points_difference()
    difference = total_points_scored - total_points_conceded
    return difference
  end


  def home_wins()
    home_wins = []
    matches.each do |match|
      if match.home_team_id == @id && match.home_team_score > match.away_team_score
        home_wins << match
      end
    end
    return home_wins
  end

  def home_win_percentage
    result = (home_wins.count.to_f / home_matches.count.to_f) * 100
    return result.round(2)
  end

  def away_win_percentage
    result = (away_wins.count.to_f / away_matches.count.to_f) * 100
    return result.round(2)
  end
  
  def away_wins
    away_wins = []
    matches.each do |match|
      if match.away_team_id == @id && match.away_team_score > match.home_team_score
        away_wins << match
      end
    end
    return away_wins
  end  

  def total_attendance
    attendance = 0
    matches.each do |match|
      attendance = attendance + match.attendance
    end
    return attendance
  end

  def total_home_attendance
    attendance = 0
    matches.each do |match|
      if match.home_team_id == @id
        attendance = attendance + match.attendance
      end
    end
    return attendance
  end

  def ave_attendance
    result = total_attendance.to_f / matches.count.to_f
    return result.round
  end

  def ave_home_attendance
    result = total_home_attendance.to_f / home_matches.count.to_f
    return result.round
  end





end
