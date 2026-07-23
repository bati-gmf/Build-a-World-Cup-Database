codeally@bbb79f8cfc7f:~/project$ psql --username=freecodecamp --dbname=postgres
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.

postgres=> \1
invalid command \1
Try \? for help.
postgres=> 1
postgres-> 1
postgres-> CREAT DATABASE worldcup;
ERROR:  syntax error at or near "1"
LINE 1: 1
        ^
postgres=>  CREATE DATABASE worldcup;
ERROR:  database "worldcup" already exists
postgres=> \d
Did not find any relations.
postgres=> CREATE TABLE teams(team_id SERISL PRIMSRY KEY);
ERROR:  syntax error at or near "PRIMSRY"
LINE 1: CREATE TABLE teams(team_id SERISL PRIMSRY KEY);
                                          ^
postgres=> CREATE TABLE teams(team_id SERIAL PRIMSRY KEY);
ERROR:  syntax error at or near "PRIMSRY"
LINE 1: CREATE TABLE teams(team_id SERIAL PRIMSRY KEY);
                                          ^
postgres=> CREATE TABLE teams(team_id SERIAL PRIMARY KEY);
CREATE TABLE
postgres=> \d teams
                               Table "public.teams"
 Column  |  Type   | Collation | Nullable |                Default                 
---------+---------+-----------+----------+----------------------------------------
 team_id | integer |           | not null | nextval('teams_team_id_seq'::regclass)
Indexes:
    "teams_pkey" PRIMARY KEY, btree (team_id)

postgres=> CREATE TABLE games(game_id SERIAL PRIMARY KEY);
CREATE TABLE
postgres=> ALTER TABLE teams ADD COLUMN name VARCHAR(50) UNIQUE NOT NULL;
ALTER TABLE
postgres=> ALTER TABLE games  ADD COLUMN round VARCHAR(50)  NOT NULL;
ALTER TABLE
postgres=> ALTER TABLE games  ADD COLUMN year INT  NOT NULL;
ALTER TABLE
postgres=> \d games
                                      Table "public.games"
 Column  |         Type          | Collation | Nullable |                Default                 
---------+-----------------------+-----------+----------+----------------------------------------
 game_id | integer               |           | not null | nextval('games_game_id_seq'::regclass)
 round   | character varying(50) |           | not null | 
 year    | integer               |           | not null | 
Indexes:
    "games_pkey" PRIMARY KEY, btree (game_id)

postgres=> \d teams
                                      Table "public.teams"
 Column  |         Type          | Collation | Nullable |                Default                 
---------+-----------------------+-----------+----------+----------------------------------------
 team_id | integer               |           | not null | nextval('teams_team_id_seq'::regclass)
 name    | character varying(50) |           | not null | 
Indexes:
    "teams_pkey" PRIMARY KEY, btree (team_id)
    "teams_name_key" UNIQUE CONSTRAINT, btree (name)

postgres=> ALTER TABLE games  ADD COLUMN winner_id  INT REFERENCES teams(team_id);
ALTER TABLE
postgres=> \d games
                                       Table "public.games"
  Column   |         Type          | Collation | Nullable |                Default                 
-----------+-----------------------+-----------+----------+----------------------------------------
 game_id   | integer               |           | not null | nextval('games_game_id_seq'::regclass)
 round     | character varying(50) |           | not null | 
 year      | integer               |           | not null | 
 winner_id | integer               |           |          | 
Indexes:
    "games_pkey" PRIMARY KEY, btree (game_id)
Foreign-key constraints:
    "games_winner_id_fkey" FOREIGN KEY (winner_id) REFERENCES teams(team_id)

postgres=> ALTER TABLE games  ADD COLUMN opponent_id  INT REFERENCES teams(team_id);
ALTER TABLE
postgres=> \d games
postgres=> \d teams
                                      Table "public.teams"
 Column  |         Type          | Collation | Nullable |                Default                 
---------+-----------------------+-----------+----------+----------------------------------------
 team_id | integer               |           | not null | nextval('teams_team_id_seq'::regclass)
 name    | character varying(50) |           | not null | 
Indexes:
    "teams_pkey" PRIMARY KEY, btree (team_id)
    "teams_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "games" CONSTRAINT "games_opponent_id_fkey" FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
    TABLE "games" CONSTRAINT "games_winner_id_fkey" FOREIGN KEY (winner_id) REFERENCES teams(team_id)

postgres=> CREATE TABLE teams(team_id SERIAL PRIMARY KEY);
ERROR:  relation "teams" already exists
postgres=> \d teams
                                      Table "public.teams"
 Column  |         Type          | Collation | Nullable |                Default                 
---------+-----------------------+-----------+----------+----------------------------------------
 team_id | integer               |           | not null | nextval('teams_team_id_seq'::regclass)
 name    | character varying(50) |           | not null | 
Indexes:
    "teams_pkey" PRIMARY KEY, btree (team_id)
    "teams_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "games" CONSTRAINT "games_opponent_id_fkey" FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
    TABLE "games" CONSTRAINT "games_winner_id_fkey" FOREIGN KEY (winner_id) REFERENCES teams(team_id)

postgres=> CREATE TABLE games(game_id SERIAL PRIMARY KEY);
ERROR:  relation "games" already exists
postgres=> ALTER TABLE teams ADD COLUMN name VARCHAR(50) UNIQUE NOT NULL;
ERROR:  column "name" of relation "teams" already exists
postgres=> ALTER TABLE games  ADD COLUMN round VARCHAR(50) NOT NULL;
ERROR:  column "round" of relation "games" already exists
postgres=> ALTER TABLE games  ADD COLUMN year INT  NOT NULL;
ERROR:  column "year" of relation "games" already exists
postgres=> \d games
postgres=> \d teams
                                      Table "public.teams"
 Column  |         Type          | Collation | Nullable |                Default                 
---------+-----------------------+-----------+----------+----------------------------------------
 team_id | integer               |           | not null | nextval('teams_team_id_seq'::regclass)
 name    | character varying(50) |           | not null | 
Indexes:
    "teams_pkey" PRIMARY KEY, btree (team_id)
    "teams_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "games" CONSTRAINT "games_opponent_id_fkey" FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
    TABLE "games" CONSTRAINT "games_winner_id_fkey" FOREIGN KEY (winner_id) REFERENCES teams(team_id)

postgres=> ALTER TABLE games  ADD COLUMN opponent_id  INT REFERENCES teams(team_id);
ERROR:  column "opponent_id" of relation "games" already exists
postgres=> ALTER TABLE games  ADD COLUMN winner_goals INT NOT NULL;
ALTER TABLE
postgres=> ALTER TABLE games  ADD COLUMN opponent_goals INT NOT NULL;
ALTER TABLE
postgres=> ALTER \d games
postgres-> ALTER TABLE games ALTER COLUMN winner_id SET NOT NULL;
ERROR:  syntax error at or near "ALTER"
LINE 2: ALTER TABLE games ALTER COLUMN winner_id SET NOT NULL;
        ^
postgres=> ALTER TABLE games ALTER COLUMN winner_id SET NOT NULL;
ALTER TABLE
postgres=> \d games
postgres=> ALTER TABLE games ALTER COLUMN opponent_id SET NOT NULL;
ALTER TABLE
postgres=> \d games
postgres=> SELECT * FROM games ;
postgres=> SELECT * FROM games ;
postgres=> SELECT * FROM  teams ;
 team_id | name 
---------+------
(0 rows)

postgres=> SELECT * FROM games ;
postgres=> SELECT * FROM teams ;
 team_id | name 
---------+------
(0 rows)

postgres=> \d games
postgres=> SELECT * FROM games ;
postgres=> 