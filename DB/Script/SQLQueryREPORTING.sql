----***Create Select/Views staments with joint,aggregates,etc at least 15 t-sql***----

--1
CREATE VIEW BusTypeBus
AS 
SELECT 
	B.licence_plate,
	B.capacity,
	TB.[Description]
FROM 
	dbo.Bus B
RIGHT JOIN 
	dbo.Type_bus TB
ON
	B.ID_type_bus = TB.ID
GO 


--2
SELECT 
	 DISTINCT  G.[Name], TB.[Description] 
FROM 
	Garage G
JOIN 
	Town T 
	ON 
	G.ID_town = T.[ID]
JOIN
	Journey_town JT 
	ON 
	T.[ID] = JT.ID_town
JOIN 
	Journey J 
	ON 
	JT.ID_journey = J.ID 
JOIN 
	Route_journey RJ 
	ON 
	J.ID = RJ.ID_journey
JOIN 
	[Route] R 
	ON 
	RJ.ID_route = R.ID
JOIN 
	Bus B 
	ON 
	R.ID = B.ID_route
JOIN 
	Type_bus TB 
	ON 
	B.ID_type_bus = TB.ID
GROUP BY
	G.[Name], TB.[Description]

GO 

--3
SELECT 
	 DISTINCT  D.[Name], R.[Name], B.licence_plate
FROM 
	dbo.Driver D
JOIN 
	dbo.Journey J
	ON
	D.ID_journey = J.ID
JOIN
	dbo.Route_journey RJ
	ON
	J.ID = RJ.ID_journey
JOIN
	dbo.[Route] R
	ON
	RJ.ID_route = R.ID 
JOIN
	dbo.Bus B
	ON
	R.ID = B.ID_route
GROUP BY
	D.[Name], R.[Name], B.licence_plate

GO

--4
SELECT 
	 DISTINCT  B.licence_plate, B.size, R.[Name], R.[Description]
FROM 
	dbo.[Route] R
JOIN
	dbo.Bus B
	ON
	R.ID = B.ID_route
GROUP BY
	B.licence_plate, B.size, R.[Name], R.[Description]

GO

--5
SELECT 
	 DISTINCT  B.licence_plate, R.[Description], RL.pass_average
FROM 
	dbo.Bus B
	
JOIN
	dbo.[Route] R
	ON
	B.ID_route = R.ID  
JOIN
	dbo.Route_log RL
	ON
	R.ID = RL.ID_route
GROUP BY
	B.licence_plate, R.[Description], RL.pass_average

GO

--6
CREATE VIEW GarageTown
AS 
SELECT DISTINCT
	G.[Name] GarageName, T.[Name] TownName,  G.Capacity 
FROM 
	dbo.Garage G
JOIN 
	dbo.Town T
	ON
	G.ID_town = T.ID
GROUP BY
	G.[Name], T.[Name],  G.Capacity
GO 


--7
SELECT 
	 DISTINCT COUNT(ID) TotalId, [Name]
FROM 
	dbo.Journey


GROUP BY 
	[Name]
ORDER BY	
	TotalId

GO

--8
SELECT 
	B.licence_plate,
	B.capacity,
	COUNT(TB.ID) CountTypeBus
FROM 
	dbo.Bus B
JOIN 
	dbo.Type_bus TB
ON
	B.ID_type_bus = TB.ID	
GROUP BY 
	B.licence_plate,
	B.capacity
ORDER BY	
	CountTypeBus
GO 
 
--9
SELECT 
	 DISTINCT  D.[Name], T.[Name]
FROM 
	dbo.Driver D
JOIN 
	dbo.Journey J
	ON
	D.ID_journey = J.ID
JOIN
	dbo.Journey_town JT
	ON
	J.ID = JT.ID_journey
JOIN
	dbo.Town T
	ON
	JT.ID_town = T.ID
	 

GROUP BY
	 D.[Name], T.[Name]

GO

--10
SELECT 
	 DISTINCT  G.[Name], Count(B.licence_plate) TotalBusXGarage
FROM 
	Garage G
JOIN 
	Town T 
	ON 
	G.ID_town = T.[ID]
JOIN
	Journey_town JT 
	ON 
	T.[ID] = JT.ID_town
JOIN 
	Journey J 
	ON 
	JT.ID_journey = J.ID 
JOIN 
	Route_journey RJ 
	ON 
	J.ID = RJ.ID_journey
JOIN 
	[Route] R 
	ON 
	RJ.ID_route = R.ID
JOIN 
	Bus B 
	ON 
	R.ID = B.ID_route

GROUP BY 
	G.[Name]
ORDER BY	
	TotalBusXGarage

GO 

--11
SELECT 
	 DISTINCT  B.licence_plate, R.[Description], RL.[Date]
FROM 
	dbo.Bus B
JOIN
	dbo.[Route] R
	ON
	B.ID_route = R.ID
JOIN
	dbo.Route_log RL
	ON
	R.ID = RL.ID_route
WHERE
	RL.[Date] BETWEEN '2021-07-01' AND '2021-09-11'
GO 

--12
SELECT 
	 DISTINCT  D.[Name], J.[Name] JourneyName, T.[Name] TownName
 FROM 
	dbo.Driver D
JOIN 
	dbo.Journey J
	ON
	D.ID_journey = J.ID
JOIN
	dbo.Journey_town JT
	ON
	J.ID = JT.ID_journey
JOIN
	dbo.Town T
	ON
	JT.ID_town = T.ID
WHERE
	D.[Name] = 'aaron'



GO

--13 
SELECT DISTINCT
	G.[Name] GarageName, T.[Name] TownName,  G.Capacity 
FROM 
	dbo.Garage G
JOIN 
	dbo.Town T
	ON
	G.ID_town = T.ID
GROUP BY
	G.[Name], T.[Name],  G.Capacity
GO 

--14
SELECT 
	 DISTINCT  G.[Name], TB.[Description], J.[Name]
FROM 
	Garage G
JOIN 
	Town T 
	ON 
	G.ID_town = T.[ID]
JOIN
	Journey_town JT 
	ON 
	T.[ID] = JT.ID_town
JOIN 
	Journey J 
	ON 
	JT.ID_journey = J.ID 
JOIN 
	Route_journey RJ 
	ON 
	J.ID = RJ.ID_journey
JOIN 
	[Route] R 
	ON 
	RJ.ID_route = R.ID
JOIN 
	Bus B 
	ON 
	R.ID = B.ID_route
JOIN 
	Type_bus TB 
	ON 
	B.ID_type_bus = TB.ID

WHERE 
	J.[Name] = 'Waverly-Riverside'
	

GO 

--15
SELECT 
	B.licence_plate,
	B.capacity,
	TB.[Description]
FROM 
	dbo.Bus B
INNER JOIN 
	dbo.Type_bus TB
ON
	B.ID_type_bus = TB.ID
WHERE
	B.licence_plate = 'ABD-K19'

GO 

