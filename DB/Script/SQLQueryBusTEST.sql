-----TEST CRUD`S----

--------Insert--------
GO
	EXEC spInsertBus 'FF01', 20, 'Medium', 1, 5 ;
GO
	EXEC spInsertDriver 'Brandon Conejo', 'Radom 02', '+506 88880808',  1;
GO
	EXEC spInsertGarage 'Rabbit`s Garage', 50, 60;
GO
	EXEC spInsertJourney 'Mozila-forest';
GO
	EXEC spInsertJourneyTown 10000, 39;
GO
	EXEC spInsertRoute 'Route 1000', 'Prueba';
GO
	EXEC spInsertRouteJourney 1, 39;
GO
	EXEC spInsertRouteLog 45, '05-03-2021', 1;
GO
	EXEC spInsertTown 'EXAMPLE'
GO
	EXEC spInsertTypeBus 'ULTRA BIG'
GO

--------Update--------
GO
	EXEC spUpdateBus 'FF01', 39, 'Big', 5, 5 ;
GO
	EXEC spUpdateDriver 57, 'Brandon', 'Papaya Ave. 01', '+506 8525-8282', 2 ;
GO
	EXEC spUpdateGarage 113, 'Rabbt`s Garage #1', 60, 60 ;
GO
	EXEC spUpdateJourney 59, 'Forest-Mozilla';
GO
	EXEC spUpdateJourneyTown 1, 1; --***
GO
	EXEC spUpdateRoute 01, 'example', 'example description';
GO
	EXEC spUpdateRouteJourney 1, 1; 
GO	
	EXEC spUpdateRouteLog 57, 10, '07-07-2020', 1166; 
GO
	EXEC spUpdateTown 1, 'EXAMPLE UPDATE'
GO
	EXEC spUpdateTypeBus 13, 'Ultra'
GO
--------Select--------
GO
	EXEC spSelectBus 'FF01';
GO
	EXEC spSelectDriver 57;
GO
	EXEC spSelectGarage 113;
GO
	EXEC spSelectJourney 'heroku';
GO
	EXEC spSelectJourneyTown;
GO
	EXEC spSelectRoute 'Route 10';
GO
	EXEC spSelectRouteJourney;
GO
	EXEC spSelectRouteLog 30;
GO
	EXEC spSelectTown 1
GO
	EXEC spSelectTypeBus 13
GO

--------Delete--------
GO
	EXEC spDeleteBus 'FF01';
GO
	EXEC spDeleteDriver 57;
GO
	EXEC spDeleteGarage 113;
GO
	EXEC spDeleteJourney 28;
GO
	EXEC spDeleteJourneyTown 29, 25;
GO
	EXEC spDeleteRoute 01;
GO
	EXEC spDeleteRouteJourney 1, 1;
GO
	EXEC spDeleteRouteLog 30;
GO
	EXEC spDeleteTown 31
GO
	EXEC spDeleteTypeBus 1
GO

