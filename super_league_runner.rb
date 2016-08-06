require_relative('models/match')
require_relative('models/team')
require_relative('models/league')
require('pry-byebug')

class SuperLeagueRunner

  def initialize(league)
    @league = league
  end
# NOT WORKING
  def run_league
    team_totals = []
    @teams.each do |team|
      team_totals << {name: @team.name, points: @team.league_points}
    end
    return team_totals
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

