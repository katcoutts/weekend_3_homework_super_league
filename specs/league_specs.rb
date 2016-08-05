require('minitest/autorun')
require('minitest/rg')
require_relative('../models/league')
require_relative('../models/team')
require_relative('../models/match')

class TestLeague < Minitest::Test

  def setup
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
  end

  def test_has_matches()
    assert_equal(12, @league.matches.count)
  end 

  def test_has_teams()
    assert_equal(4, @league.teams.count)
  end

  def test_can_calculate_total_points_scored()
    assert_equal( 422, @league.total_points)
  end

  def test_can_calculate_home_teams_total_points()
    assert_equal( 210, @league.home_team_points)
  end

  def test_can_calculate_away_teams_total_points()
    assert_equal( 212, @league.away_team_points)
  end

  def test_can_count_home_wins()
    assert_equal( 6, @league.count_home_wins)
  end

  def test_can_count_away_wins()
    assert_equal(5, @league.count_away_wins)
  end

  def test_can_count_draws()
    assert_equal( 1, @league.count_draws )
  end

  def test_can_count_a_teams_wins()
    assert_equal(6, @league.team_wins(@team1))
  end


end