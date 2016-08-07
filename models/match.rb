require('pg')
require_relative('../db/sql_runner')


class Match

  attr_reader :id, :winner_id, :attendance 
  attr_accessor :home_team_id, :away_team_id, :home_team_score, :away_team_score

  def initialize(options)
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i 
    @winner_id = options['winner_id'].to_i
    @attendance = options['attendance'].to_i
  end


  def self.all
   sql = "SELECT * FROM matches;"
   matches = SqlRunner.run(sql)
   result = matches.map {|match| Match.new(match)}
   return result
 end

 def self.delete_all()
  sql = "DELETE FROM matches;"
  SqlRunner.run(sql)
end

def save()
  winner
  sql = "INSERT INTO matches (home_team_id, away_team_id, home_team_score, away_team_score, winner_id, attendance) VALUES (#{ @home_team_id }, #{@away_team_id}, #{@home_team_score}, #{@away_team_score}, #{@winner_id}, #{@attendance}) RETURNING *;"
  match = SqlRunner.run( sql ).first
  @id = match['id'].to_i  
end


def winner()
  if @home_team_score > @away_team_score
    sql = "SELECT teams.* FROM teams WHERE id = #{@home_team_id};"
    win = SqlRunner.run( sql ).first
    winner = Team.new(win)
    @winner_id = winner.id
  elsif @away_team_score > @home_team_score
    sql = "SELECT teams.* FROM teams WHERE id = #{@away_team_id};"
    win = SqlRunner.run( sql ).first
    winner = Team.new(win)
    @winner_id = winner.id
  elsif @away_team_score == @home_team_score
    winner = nil 
    @winner_id = 0
  end
  return winner
end

def update()
  sql = "UPDATE matches SET
  home_team_id = '#{ @home_team_id }',
  away_team_id = '#{ @away_team_id }',
  home_team_score = '#{ @home_team_score }',
  away_team_score = '#{ @away_team_score }',
  WHERE id = #{ @id };"
  SqlRunner.run(sql)
  return self
end

def delete()
  sql = "DELETE FROM matches WHERE  
  id = #{@id};"
  SqlRunner.run( sql )
end

def home_team()
  sql = "SELECT teams.* FROM teams WHERE id = #{@home_team_id};"
  home_team = SqlRunner.run( sql ).first
  result = Team.new(home_team)
  return result
end

def away_team()
  sql = "SELECT teams.* FROM teams WHERE id = #{@away_team_id};"
  away_team = SqlRunner.run( sql ).first
  result = Team.new(away_team)
  return result
end

def teams()
  sql = "SELECT teams.* FROM teams WHERE id = #{@away_team_id} OR id = #{@home_team_id};"
  teams = SqlRunner.run( sql )
  result = teams.map { |team| Team.new(team) }
  return result
end



end

