DROP TABLE matches;
DROP TABLE teams;

CREATE TABLE teams(
  id serial4 primary key,
  name varchar(255)
);

CREATE TABLE matches(
  id serial4 primary key,
  home_team_score int4,
  away_team_score int4,
  home_team_id int4 references teams(id) ON DELETE CASCADE,
  away_team_id int4 references teams(id) ON DELETE CASCADE,
  winner_id int4
);



