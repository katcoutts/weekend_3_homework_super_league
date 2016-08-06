require('minitest/autorun')
require('minitest/rg')
require_relative('../models/league')
require_relative('../models/team')
require_relative('../models/match')

class TestLeague < Minitest::Test

  def setup
    Team.delete_all()
    Match.delete_all()

    @team1 = Team.new({ 'name' => 'Castleford Tigers'})
    @team2 = Team.new({'name' => 'Leeds Rhinos'})
    @team3 = Team.new({'name' => 'Warrington Wolves'})
    @team4 = Team.new({'name' => 'Wigan Warriors'})
    @team1.save
    @team2.save
    @team3.save
    @team4.save

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

  def test_can_give_biggest_winning_score()
    assert_equal(32, @league.biggest_winning_score)
  end

  def test_can_give_lowest_winning_score()
    assert_equal(14, @league.lowest_winning_score)
  end

  def test_can_give_average_points_scored_by_a_team_in_a_match()
    assert_equal(18, @league.average_points())
  end

  def test_can_give_average_winning_score
    assert_equal(19, @league.average_winning_score())
  end

  def test_can_get_winning_margins
    assert_equal([4, 3, 8, 4, 8, 10, 1, 12, 16, 0, 6, 2], @league.winning_margins)
  end


  def test_can_get_average_winning_margin
    assert_equal(6, @league.ave_winning_margin)
  end

  def test_team_info
    result = @league.team_info
    assert_equal([{:name=>"Castleford Tigers", :points=>12}, {:name=>"Leeds Rhinos", :points=>3}, {:name=>"Warrington Wolves", :points=>4}, {:name=>"Wigan Warriors", :points=>5}], result)
  end


    def test_can_count_a_teams_wins()
      assert_equal(6, @league.team_wins(@team1))
    end

    def test_can_calculate_a_teams_points
      assert_equal(12, @league.team_points(@team1))
    end

    # not working
    # def test_can_give_match_winner_id()
    #   result = @league.match_winner(@match1)
    #   assert_equal('Castleford Tigers', result.name)
    # end

  

    def test_can_total_a_teams_points
      assert_equal(133, @league.total_a_teams_points(@team1))
    end



  def test_gives_team_positions
    result = @league.team_positions
    assert_equal([{:name=>"Castleford Tigers", :points=>12}, {:name=>"Wigan Warriors", :points=>5}, {:name=>"Warrington Wolves", :points=>4}, {:name=>"Leeds Rhinos", :points=>3}], result)
  end

  def test_gives_league_topper
    result = @league.league_topper
    assert_equal({:name=>"Castleford Tigers", :points=>12}, result)
  end

  def test_gives_league_table_info
    result = @league.league_table_info
    assert_equal([{:name=>"Castleford Tigers", :wins=>6, :losses=>0, :draws=>0, :points_for=>133, :points_against=>90, :points_difference=>43, :league_points=>12}, {:name=>"Wigan Warriors", :wins=>2, :losses=>3, :draws=>1, :points_for=>101, :points_against=>104, :points_difference=>-3, :league_points=>5}, {:name=>"Warrington Wolves", :wins=>2, :losses=>4, :draws=>0, :points_for=>90, :points_against=>117, :points_difference=>-27, :league_points=>4}, {:name=>"Leeds Rhinos", :wins=>1, :losses=>4, :draws=>1, :points_for=>98, :points_against=>111, :points_difference=>-13, :league_points=>3}], result)
  end

  



end