SELECT Name
FROM DBZ_Citizens
WHERE Name LIKE '%u%';

SELECT *
FROM DBZ_Locations;

SELECT *
FROM DBZ_Observations;

SELECT L.Name, E.Description
FROM DBZ_Evidence E
JOIN DBZ_Locations L ON L.LocationID = E.LocationID
WHERE E.Description LIKE '%fingerprint%';

SELECT 
    ct.Name AS CitizenName,
    lc.Name AS LocationName,
    FORMAT(CAST(TimeOfDay AS DATETIME), 'hh:mm tt') AS TimeOfDayFormatted,
    os.Description
FROM DBZ_Observations AS os
JOIN DBZ_Locations AS lc ON os.LocationID = lc.LocationID
JOIN DBZ_Citizens AS ct ON os.CitizenID = ct.CitizenID;

SELECT CT.Name, LC.Name, OB.TimeOfDay, OB.Description
FROM DBZ_Observations AS OB 
JOIN DBZ_Locations AS LC
ON OB.LocationID = LC.LocationID
JOIN DBZ_Citizens AS CT 
ON CT.CitizenID = OB.CitizenID;

SELECT O.CitizenID, C.Name, C.Role, C.PowerLevel, O.Description AS Observation, 
E.Description AS Evidence 
FROM DBZ_Observations O 
JOIN DBZ_Citizens C ON O.CitizenID = C.CitizenID 
JOIN DBZ_Evidence E ON O.LocationID = E.LocationID 
WHERE O.LocationID = 5 
AND C.PowerLevel > 5000;