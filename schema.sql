/*
This is the schema for the Power Hour conference
The schema will consist of 3 entities: team, player, and statistics
*/

DROP TABLE team CASCADE CONSTRAINTS;
DROP TABLE player CASCADE CONSTRAINTS;
DROP TABLE statistics CASCADE CONSTRAINTS;

CREATE TABLE team(
    UniversityName     Char(50)     NOT NULL,
    City        Char(50)        NOT NULL,
    State       Char(50)        NOT NULL,
    CoachLastName       Char(50)        NOT NULL,
    CONSTRAINT      TEAM_PK     PRIMARY KEY(UniversityName)
    );

CREATE TABLE player(
    PlayerID        Int     NOT NULL,
    PlayerFirstName     Char (50)       NOT NULL,
    PlayerLastName      Char(50)        NOT NULL,
    PlayerJerseyNum     Int     NOT NULL,
    PlayerPosition      Char(50)        NOT NULL,
    PlayerGrade         Char(25)        NOT NULL,
    UniversityName    Char(50)        NOT NULL,
    CONSTRAINT      PLAYER_PK       PRIMARY KEY(PlayerID),
    CONSTRAINT      TEAM_FK     FOREIGN KEY(UniversityName)
                    REFERENCES team(UniversityName)
    );
    
CREATE TABLE statistics(
    PlayerID      Int       NOT NULL,
    Points      Int     NULL,
    Assists     Int     NULL,
    Rebounds        Int     NULL,
    FieldGoalPct        Int     NULL,
    CONSTRAINT      STATISTICS_PK       PRIMARY KEY(PlayerID),
    CONSTRAINT      PLAYER_FK       FOREIGN KEY(PlayerID)
                    REFERENCES player(PlayerID)
    );
