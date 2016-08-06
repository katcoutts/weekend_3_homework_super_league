require_relative('models/match')
require_relative('models/team')
require_relative('models/league')
require('pry-byebug')

class SuperLeagueRunner

  def initialize(league)
    @league = league
  end

  def run_league
  end

end




@team1 = Team.new({ 'name' => 'Castleford Tigers'})
@team2 = Team.new({'name' => 'Leeds Rhinos'})
@team3 = Team.new({'name' => 'Warrington Wolves'})
@team4 = Team.new({'name' => 'Wigan Warriors'})
@match1 = Match.new({'home_team_id' => @team1.id, 'away_team_id' => @team2.id, 'home_team_score' => 32, 'away_team_score' => 28})
@match2 = Match.new({'home_team_id' => @team3.id, 'away_team_id' => @team4.id, 'home_team_score' => 24, 'away_team_score' => 27})
@match3 = Match.new({'home_team_id' => @team1.id, 'away_team_id' => @team3.id, 'home_team_score' => 16, 'away_team_score' => 8})
@match4 = Match.new({'home_team_id' => @team2.id, 'away_team_id' => @team4.id, 'home_team_score' => 14, 'away_team_score' => 10})
@match5 = Match.new({'home_team_id' => @team4.id, 'away_team_id' => @team1.id, 'home_team_score' => 16, 'away_team_score' => 24})
@match6 = Match.new({'home_team_id' => @team2.id, 'away_team_id' => @team3.id, 'home_team_score' => 8, 'away_team_score' => 18})
@match7 = Match.new({'home_team_id' => @team2.id, 'away_team_id' => @team1.id, 'home_team_score' => 18, 'away_team_score' => 19})
@match8 = Match.new({'home_team_id' => @team4.id, 'away_team_id' => @team3.id, 'home_team_score' => 24, 'away_team_score' => 12})
@match9 = Match.new({'home_team_id' => @team3.id, 'away_team_id' => @team1.id, 'home_team_score' => 12, 'away_team_score' => 28})
@match10 = Match.new({'home_team_id' => @team4.id, 'away_team_id' => @team2.id, 'home_team_score' => 16, 'away_team_score' => 16})
@match11 = Match.new({'home_team_id' => @team1.id, 'away_team_id' => @team4.id, 'home_team_score' => 14, 'away_team_score' => 8})
@match12 = Match.new({'home_team_id' => @team3.id, 'away_team_id' => @team2.id, 'home_team_score' => 16, 'away_team_score' => 14})

@teams = [@team1, @team2, @team3, @team4]
@matches = [@match1, @match2, @match3, @match4, @match5, @match6, @match7, @match8, @match9, @match10, @match11, @match12]

@league = League.new(@matches, @teams)

runner = SuperLeagueRunner.new(@league)

puts "Super League 2020 has finished."
puts "Would you like to find out how it went? y/n"
answer = gets.chomp
if answer == 'y'
  runner.run_league
else 
  puts "Ok. See you later."
end

