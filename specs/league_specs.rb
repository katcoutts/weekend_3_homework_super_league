require('minitest/autorun')
require('minitest/rg')
require_relative('../models/league')
require_relative('../models/team')
require_relative('../models/matches')
require_relative('../console')

class TestLeague < Minitest::Test

  def setup

    team1 = Team.new({ 'name' => 'Castleford Tigers'})
    team2 = Team.new({'name' => 'Leeds Rhinos'})
    team3 = Team.new({'name' => 'Warrington Wolves'})
    team4 = Team.new({'name' => 'Wigan Warriors'})
    match1 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team2.id, 'home_team_score' => 32, 'away_team_score' => 28})
    match2 = Match.new({'home_team_id' => team3.id, 'away_team_id' => team4.id, 'home_team_score' => 24, 'away_team_score' => 27})
    match3 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team3.id, 'home_team_score' => 16, 'away_team_score' => 8})
    match4 = Match.new({'home_team_id' => team2.id, 'away_team_id' => team4.id, 'home_team_score' => 14, 'away_team_score' => 10})
    match5 = Match.new({'home_team_id' => team4.id, 'away_team_id' => team1.id, 'home_team_score' => 16, 'away_team_score' => 24})
    match6 = Match.new({'home_team_id' => team2.id, 'away_team_id' => team3.id, 'home_team_score' => 8, 'away_team_score' => 18})
    match7 = Match.new({'home_team_id' => team2.id, 'away_team_id' => team1.id, 'home_team_score' => 18, 'away_team_score' => 19})
    match8 = Match.new({'home_team_id' => team4.id, 'away_team_id' => team3.id, 'home_team_score' => 24, 'away_team_score' => 12})
    match9 = Match.new({'home_team_id' => team3.id, 'away_team_id' => team1.id, 'home_team_score' => 12, 'away_team_score' => 28})
    match10 = Match.new({'home_team_id' => team4.id, 'away_team_id' => team2.id, 'home_team_score' => 16, 'away_team_score' => 16})
    match11 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team4.id, 'home_team_score' => 14, 'away_team_score' => 8})
    match12 = Match.new({'home_team_id' => team3.id, 'away_team_id' => team2.id, 'home_team_score' => 16, 'away_team_score' => 14})

    teams = [team1, team2, team3, team4]

    @league = League.new(matches, teams)
  end