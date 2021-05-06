/* 
1. The first example shows the goal scored by a player with the last name 'Bender'. 
The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime

Modify it to show the matchid and player name for all goals scored by Germany. 
To identify German players, check for: teamid = 'GER'   
*/
/*      SOLUTION       */

SELECT matchid, player FROM goal 
WHERE teamid = 'GER';


/*
2. From the previous query you can see that Lars Bender's scored a goal in game 1012. 
Now we want to know what teams were playing in that match.

Notice in the that the column matchid in the goal table corresponds to the id column in the game table. 
We can look up information about game 1012 by finding that row in the game table.

Show id, stadium, team1, team2 for just game 1012
*/

/*      SOLUTION       */

SELECT id,stadium,team1,team2 FROM game
WHERE id = '1012';


/*
3. You can combine the two steps into a single query with a JOIN.

SELECT *
  FROM game JOIN goal ON (id=matchid)

The FROM clause says to merge data from the goal table with that from the game table. 
The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. 
(If we wanted to be more clear/specific we could say
ON (game.id=goal.matchid)

The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.

Modify it to show the player, teamid, stadium and mdate for every German goal.
*/

/*          SOLUTION        */
SELECT goal.player, goal.teamid, game.stadium, game.mdate FROM goal
JOIN game ON goal.matchid = game.id
WHERE goal.teamid = 'GER';


/*
4. Use the same JOIN as in the previous question.

Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
*/

/*        SOLUTION          */
SELECT game.team1, game.team2, goal.player FROM goal
JOIN game ON goal.matchid = game.id
WHERE goal.player LIKE 'Mario%';



/*
5. The table eteam gives details of every national team including the coach. 
You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id

Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
*/

/*        SOLUTION          */
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime FROM goal
JOIN eteam ON eteam.id = goal.teamid
WHERE goal.gtime <= 10;

/*
7. To JOIN game with eteam you could use either
game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)

Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id

List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
*/

/*        SOLUTION          */
SELECT game.mdate, eteam.teamname FROM game
JOIN eteam ON (game.team1=eteam.id)
WHERE eteam.coach = 'Fernando Santos';


















