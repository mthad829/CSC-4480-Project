-- Players who have shot over 60%
SELECT PlayerFirstName, PlayerLastName, FieldGoalPct FROM player p, statistics s WHERE p.PlayerID = s.PlayerID AND s.FieldGoalPct > 60 ORDER BY p.PlayerLastName ASC;
    
-- Players with over 1000 career points
SELECT PlayerFirstName, PlayerLastName, Points FROM player p, statistics s WHERE p.PlayerID = s.PlayerID AND s.Points > 1000 ORDER BY p.PlayerLastName ASC;

-- Players from Stockton University with over 200 rebounds
SELECT PlayerFirstName, PlayerLastName, Rebounds FROM player p, statistics s WHERE p.PlayerID = s.PlayerID AND s.Rebounds > 200 AND p.UniversityName = 'Stockton University' ORDER BY s.Rebounds DESC;

-- Centers with field goal % over 50 and points greater than 1000
SELECT PlayerFirstName, PlayerLastName, Points, FieldGoalPct FROM player p, statistics s WHERE p.PlayerID = s.PlayerID AND s.Points > 1000 AND s.FieldGoalPct > 50 AND p.PlayerPosition = 'Center' ORDER BY s.FieldGoalPct ASC;

-- Teams with combined points greater than 4,500
SELECT DISTINCT t.UniversityName, sum(s.points) FROM (player p join statistics s on p.playerID = s.playerID) join team t ON p.UniversityName = t.UniversityName WHERE t.UniversityName = p.UniversityName GROUP BY t.UniversityName HAVING SUM(s.points) > 4500 ORDER BY SUM(s.Points) DESC;
