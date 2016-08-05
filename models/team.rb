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

def home_matches()
  sql = "SELECT matches.* FROM matches WHERE home_team_id = #{@id};"
  home_matches = SqlRunner.run( sql )
  result = home_matches.map { |match| Match.new(match) }
  return result
end

def away_matches()
  sql = "SELECT matches.* FROM matches WHERE away_team_id = #{@id};"
  away_matches = SqlRunner.run( sql )
  result = away_matches.map { |match| Match.new(match) }
  return result
end

def matches()
  away_matches() + home_matches() 
end





end
# def self.find(id)
#   sql = "SELECT * FROM artists WHERE id = #{id};"
#   artist = SqlRunner.run(sql).first
#   result = Artist.new(artist)
# end