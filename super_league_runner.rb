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
@team1.save()
@team2.save()
@team3.save()
@team4.save()
@match1 = Match.new({'home_team_id' => @team1.id, 'away_team_id' => @team2.id, 'home_team_score' => 32, 'away_team_score' => 28, 'attendance' => 11500})
@match2 = Match.new({'home_team_id' => @team3.id, 'away_team_id' => @team4.id, 'home_team_score' => 24, 'away_team_score' => 27, 'attendance' => 8640})
@match3 = Match.new({'home_team_id' => @team1.id, 'away_team_id' => @team3.id, 'home_team_score' => 16, 'away_team_score' => 8, 'attendance' => 10866})
@match4 = Match.new({'home_team_id' => @team2.id, 'away_team_id' => @team4.id, 'home_team_score' => 14, 'away_team_score' => 2, 'attendance' => 15202})
@match5 = Match.new({'home_team_id' => @team4.id, 'away_team_id' => @team1.id, 'home_team_score' => 4, 'away_team_score' => 24, 'attendance' => 9630})
@match6 = Match.new({'home_team_id' => @team2.id, 'away_team_id' => @team3.id, 'home_team_score' => 8, 'away_team_score' => 18, 'attendance' => 15976})
@match7 = Match.new({'home_team_id' => @team2.id, 'away_team_id' => @team1.id, 'home_team_score' => 18, 'away_team_score' => 19, 'attendance' => 10270})
@match8 = Match.new({'home_team_id' => @team4.id, 'away_team_id' => @team3.id, 'home_team_score' => 24, 'away_team_score' => 12, 'attendance' => 9620})
@match9 = Match.new({'home_team_id' => @team3.id, 'away_team_id' => @team1.id, 'home_team_score' => 12, 'away_team_score' => 28, 'attendance' => 9252})
@match10 = Match.new({'home_team_id' => @team4.id, 'away_team_id' => @team2.id, 'home_team_score' => 16, 'away_team_score' => 16, 'attendance' => 9230})
@match11 = Match.new({'home_team_id' => @team1.id, 'away_team_id' => @team4.id, 'home_team_score' => 14, 'away_team_score' => 8, 'attendance' => 8360})
@match12 = Match.new({'home_team_id' => @team3.id, 'away_team_id' => @team2.id, 'home_team_score' => 16, 'away_team_score' => 14, 'attendance' => 9274})

@match1.save
@match2.save
@match3.save
@match4.save
@match5.save
@match6.save
@match7.save
@match8.save
@match9.save
@match10.save
@match11.save
@match12.save

@teams = [@team1, @team2, @team3, @team4]
@matches = [@match1, @match2, @match3, @match4, @match5, @match6, @match7, @match8, @match9, @match10, @match11, @match12]

@league = League.new(@matches, @teams)

runner = SuperLeagueRunner.new(@league)

puts "Super League 2020 has finished."
puts "Here's the table."
puts @league.print_table
puts ""
puts "Here's teams ranked by attack."
puts @league.rank_teams_by_attack
puts ""
puts "And here's a look at how they defended."
puts @league.rank_teams_by_defence

