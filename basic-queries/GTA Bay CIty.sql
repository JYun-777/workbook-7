--p2 list citizens names and professions
SELECT Name, Profession
FROM GTA.Citizens;

--p3 citizens under 25
SELECT *
FROM GTA.Citizens
WHERE Age < 25;

--p4 vehicles slowest to fastest
SELECT *
FROM GTA.Vehicles
ORDER BY Speed ASC

--p5 how many vehicles does each citizen own
SELECT C.Name, COUNT(*) AS VehiclesOwned
FROM GTA.Vehicles V
JOIN GTA.Citizens C ON C.CitizenID = V.OwnerID
GROUP BY C.Name;

--p6 Highest wanted Level
SELECT MAX(WantedLevel)
FROM GTA.Citizens;

--Mission 1 wanted level 2 or more, include name, alias, wantedlevel
SELECT Name, Alias, WantedLevel
FROM GTA.Citizens
WHERE WantedLevel >= 2;

--MISSION 2 name of suspected owner, vehicle type, and brand of all stolen vehicles(IsStolen = 1)
SELECT C.Name AS VehicleOwner, V.Type AS VehicleType, V.Brand AS VehicleBrand
FROM GTA.Vehicles V
JOIN GTA.Citizens C ON C.CitizenID = V.OwnerID
WHERE IsStolen = 1

--MISSION 3 name, total money earned from completed missions, sorted by mission earnings highest to lowest
SELECT C.Name, SUM(M.Reward) AS [Total Earnings]
FROM GTA.Assignments A
JOIN GTA.Missions M ON M.MissionID = A.MissionID
JOIN GTA.Citizens C ON C.CitizenID = A.CitizenID
WHERE Completed = 1
GROUP BY C.Name
ORDER BY SUM(M.Reward) DESC;

/*INSERT INTO GTA.Assignments(CitizenID, MissionID, Completed, TimeSpent) --Edit to allow Marq to have more than one mission completed to sum up earnings
VALUES(6,201,1,45)*/

/*DELETE FROM GTA.Assignments --Edit to make someone miss out on 2 completed missions
WHERE AssignmentID = 1;*/

--MISSION 4 For each suspect completing missions, return name, # of completed missions, fastest time, slowest time
SELECT *
FROM GTA.Assignments A
JOIN GTA.Citizens C ON C.CitizenID = A.CitizenID

SELECT C.Name, COUNT(Completed) AS [Completed Missions], MAX(A.TimeSpent) AS SlowestMissionTime, MIN(A.TimeSpent) AS FastestMissionTime
FROM GTA.Assignments A
JOIN GTA.Missions M ON M.MissionID = A.MissionID
JOIN GTA.Citizens C ON C.CitizenID = A.CitizenID
WHERE Completed = 1
GROUP BY C.Name

--MISSION 5 completed at least 2 missions, earned 4000+ total 
SELECT C.Name, COUNT(Completed) AS [Completed Missions], SUM(M.Reward) AS [Total Earnings]
FROM GTA.Assignments A
JOIN GTA.Missions M ON M.MissionID = A.MissionID
JOIN GTA.Citizens C ON C.CitizenID = A.CitizenID
GROUP BY C.Name
HAVING COUNT(Completed) >= 2 AND SUM(M.Reward) >= 4000;
