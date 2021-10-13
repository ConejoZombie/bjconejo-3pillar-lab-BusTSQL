-- *CRUD: Create SPs operations  for Insert,Update,Delete,Select (Basic) for each table (script file)
USE Bus

---SPs insert dbo.Bus---
CREATE PROCEDURE spInsertBus
	@licencePlate VARCHAR(50),
	@capacity INT,
	@size VARCHAR(50),
	@IDTypeBus INT,
	@IDRoute INT
AS
BEGIN
	INSERT INTO dbo.Bus VALUES(
		@licencePlate,
		@capacity,
		@size,
		@IDTypeBus,
		@IDRoute
	);
END
GO


---SPs Update dbo.Bus---
CREATE PROCEDURE spUpdateBus
	@licencePlate VARCHAR(50),
	@capacity INT,
	@size VARCHAR(50),
	@IDTypeBus INT,
	@IDRoute INT
AS
BEGIN
	UPDATE dbo.Bus 
	
	SET capacity = @capacity,
		size = @size,
		ID_type_bus = @IDTypeBus,
		ID_route = @IDRoute
	
	WHERE licence_plate = @licencePlate
END
GO


---SPs Select dbo.Bus---
CREATE PROCEDURE spSelectBus
	@licencePlate VARCHAR(50)
AS
BEGIN
	SELECT 
		licence_plate,
		capacity,
		size,
		ID_type_bus,
		ID_route
	FROM
		dbo.Bus
	WHERE
		licence_plate = @licencePlate; 
	
END
GO


---SPs Delete dbo.Bus---
CREATE PROCEDURE spDeleteBus
	@licencePlate VARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.Bus 	
	WHERE licence_plate = @licencePlate
END
GO


----------------------------------------------------------------

---SPs insert dbo.Driver---
CREATE PROCEDURE spInsertDriver
	@name VARCHAR(50),
	@address VARCHAR(100),
	@telephone varchar(50),
	@IDJourney int
AS
BEGIN
	INSERT INTO dbo.Driver VALUES(
		
		@name,
		@address,
		@telephone,
		@IDJourney
	);
END
GO


---SPs Update dbo.Driver---
CREATE PROCEDURE spUpdateDriver
	@ID INT,
	@name VARCHAR(50),
	@address VARCHAR(100),
	@telephone varchar(50),
	@IDJourney int
AS
BEGIN
	UPDATE dbo.Driver 
	
	SET [Name] = @name,
		[Address] = @address,
		Telephone = @telephone,
		ID_journey = @IDJourney
	
	WHERE ID = @ID
END
GO


---SPs Select dbo.Drive---
CREATE PROCEDURE spSelectDriver
	@Id INT
AS
BEGIN
	SELECT 
		ID,
		[Name],
		[Address],
		Telephone,
		ID_journey

	FROM
		dbo.Driver
	WHERE
		ID = @Id; 
	
END
GO


---SPs Delete dbo.Driver---
CREATE PROCEDURE spDeleteDriver
	@Id INT
AS
BEGIN
	DELETE FROM dbo.Driver 	
	WHERE ID = @Id
END
GO


----------------------------------------------------------------

---SPs insert dbo.Garage---
CREATE PROCEDURE spInsertGarage
	@name VARCHAR(50),
	@capacity INT,
	@IdTown INT

AS
BEGIN
	INSERT INTO dbo.Garage VALUES(
		@name,
		@capacity,
		@IdTown
	);
END
GO


---SPs Update dbo.Garage---
CREATE PROCEDURE spUpdateGarage
	@Id INT,
	@name VARCHAR(50),
	@capacity int,
	@IdTown int
AS
BEGIN
	UPDATE dbo.Garage 
	
	SET [Name] = @name,
		Capacity = @capacity,
		ID_town = @IdTown
	
	WHERE ID = @ID
END
GO


---SPs Select dbo.Garage---
CREATE PROCEDURE spSelectGarage
	@Id INT
AS
BEGIN
	SELECT 
		ID
		[Name],
		Capacity,
		ID_town 

	FROM
		dbo.Garage
	WHERE
		ID = @Id; 
	
END
GO


---SPs Delete dbo.Garage---
CREATE PROCEDURE spDeleteGarage
	@Id INT
AS
BEGIN
	DELETE FROM dbo.Garage 	
	WHERE ID = @Id
END
GO


----------------------------------------------------------------

---SPs insert dbo.Journey---
CREATE PROCEDURE spInsertJourney
	@name VARCHAR(50)

AS
BEGIN
	INSERT INTO dbo.Journey VALUES(
		@name
	);
END
GO


---SPs Update dbo.Journey---
CREATE PROCEDURE spUpdateJourney
	@Id INT,
	@name VARCHAR(50)
AS
BEGIN
	UPDATE dbo.Journey 
	
	SET [Name] = @name
	
	WHERE ID = @ID
END
GO


---SPs Select dbo.Jorney---
CREATE PROCEDURE spSelectJourney
	@name varchar(50)
AS
BEGIN
	SELECT 
		ID,
		[Name]

	FROM
		dbo.Journey
	WHERE
		[name] like '%'+@name+'%';  
	
END
GO


---SPs Delete dbo.Journey---
CREATE PROCEDURE spDeleteJourney
	@Id INT
AS
	BEGIN TRY
		DELETE FROM dbo.Journey 	
		WHERE ID = @Id
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() codeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError

	END CATCH
GO


----------------------------------------------------------------

---SPs insert dbo.Journey_Town---
CREATE PROCEDURE spInsertJourneyTown
	@IdTown INT,
	@IdJourney INT

AS
	BEGIN TRY
		INSERT INTO dbo.Journey_town VALUES(
			@IdTown,
			@IdJourney
		);
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() ErrorCodeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError
	END CATCH
GO


---SPs Update dbo.JourneyTown---
CREATE PROCEDURE spUpdateJourneyTown
	@IdTown INT,
	@IdJourney INT
AS
	BEGIN TRY
		UPDATE dbo.Journey_town 
		SET ID_town = @IdTown,
			ID_journey = @IdJourney
		WHERE ID_town = @IdTown AND ID_journey = @IdJourney
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() ErrorCodeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError
	END CATCH

GO


---SPs Select dbo.JorneyTown---
CREATE PROCEDURE spSelectJourneyTown

AS
	BEGIN TRY
		SELECT 

			T.[Name] TownName,
			COUNT( T.ID ) TotalTowns
			
		FROM
			dbo.Journey J
		JOIN
			dbo.Journey_town JT
		ON
			JT.ID_journey = J.ID
		JOIN
			dbo.Town T
		ON
			T.ID = JT.ID_town

		GROUP BY
			T.[Name]
		ORDER BY
			T.[Name]
			  
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() ErrorCodeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError
	END CATCH

GO


 ---SPs Delete dbo.JourneyTown---
CREATE PROCEDURE spDeleteJourneyTown
	@IdT INT,
	@IdJ INT
AS
	BEGIN TRY
		DELETE FROM dbo.Journey_town 	
		WHERE ID_journey = @IdJ AND ID_town = @IdT
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() codeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError

	END CATCH
GO


----------------------------------------------------------------

---SPs insert dbo.Route---
CREATE PROCEDURE spInsertRoute
	@name VARCHAR(50),
	@description varchar(100)

AS
	
	IF NOT EXISTS (SELECT [Name] FROM dbo.Route WHERE [Name] = @name)
		BEGIN
			INSERT INTO dbo.[Route] 
			VALUES(@name, @description);
		END
	ELSE
		BEGIN
			PRINT 'Route name already exists'
		END

GO


---SPs Update dbo.Route---
CREATE PROCEDURE spUpdateRoute
	@Id INT,
	@name VARCHAR(50),
	@description varchar(100)
AS
BEGIN
	UPDATE dbo.[Route] 
	
	SET 
		[Name] = @name,
		[Description] = @description
	
	WHERE ID = @ID
END
GO


---SPs Select dbo.Route---
CREATE PROCEDURE spSelectRoute

	@name varchar(50)

AS
	BEGIN TRY
		SELECT 
			ID,
			[Name],
			[Description]
		FROM
			dbo.[Route]
		WHERE
			[Name] = @name
			
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() ErrorCodeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError
	END CATCH

GO


 ---SPs Delete dbo.Route---
CREATE PROCEDURE spDeleteRoute
	@Id INT
AS
	BEGIN TRY
		DELETE FROM dbo.[Route] 	
		WHERE ID = @Id
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() codeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError

	END CATCH
GO


---------------------------------------------------------------- 

---SPs insert dbo.RouteJourney---
CREATE PROCEDURE spInsertRouteJourney
	@IdRoute INT,
	@IdJourney INT

AS
	BEGIN TRY
		INSERT INTO dbo.Route_journey VALUES(
			@IdRoute,
			@IdJourney
		);
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() ErrorCodeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError
	END CATCH
GO


---SPs Update dbo.RouteJourney---
CREATE PROCEDURE spUpdateRouteJourney
	@IdRoute INT,
	@IdJourney INT
AS
	BEGIN TRY
		UPDATE dbo.Route_journey 
		SET ID_route= @IdRoute,
			ID_journey = @IdJourney
		WHERE ID_route = @IdRoute AND ID_journey = @IdJourney
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() ErrorCodeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError
	END CATCH

GO


---SPs Select dbo.JorneyTown---
CREATE PROCEDURE spSelectRouteJourney

AS
	BEGIN TRY
		SELECT 
			R.[Name] RouteName,
			J.[Name] JourneyName
			
		FROM
			dbo.[Route] R
		 JOIN 
			dbo.Route_journey RJ
		ON
			R.ID = RJ.ID_route
		JOIN
			dbo.Journey J 
		ON
			RJ.ID_journey = J.ID

		ORDER BY
			R.[Name]
			
			  
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() ErrorCodeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError
	END CATCH

GO

 ---SPs Delete dbo.RouteJourney---
CREATE PROCEDURE spDeleteRouteJourney
	@IdR INT,
	@IdJ INT
AS
	BEGIN TRY
		DELETE FROM dbo.Route_journey	
		WHERE ID_journey = @IdJ AND ID_route = @IdR
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() codeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError

	END CATCH
GO

---------------------------------------------------------------- 

---SPs insert dbo.RouteLog---
CREATE PROCEDURE spInsertRouteLog
	@passAv INT,
	@Date DATE,
	@IdRoute INT

AS
	BEGIN TRY
		IF EXISTS (SELECT ID FROM dbo.Route WHERE ID = @IdRoute)
			BEGIN
				INSERT INTO dbo.Route_log 
				VALUES(@passAv, @Date, @IdRoute);
			END
		ELSE
			BEGIN
				PRINT 'Route Id not exists'
			END

	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() ErrorCodeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError
	END CATCH
GO

---SPs Update dbo.RouteLog---
CREATE PROCEDURE spUpdateRouteLog
	@Id INT,
	@passAv INT,
	@Date DATE,
	@IdRoute INT
AS
	BEGIN TRY

		IF EXISTS (SELECT ID FROM dbo.Route WHERE ID = @IdRoute)
			BEGIN
				UPDATE dbo.Route_log
				SET pass_average = @passAv,
					[Date] = @Date,
					ID_route = @IdRoute
				WHERE ID = @Id
			END
		ELSE
			BEGIN
				PRINT 'Route Id not exist'
			END
		
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() ErrorCodeNumber,
			   ERROR_MESSAGE() [Message],
			   ERROR_LINE() ErrorLine,
			   ERROR_PROCEDURE() ProcedureError
	END CATCH

GO

---SPs Select dbo.RouteLog---
CREATE PROCEDURE spSelectRouteLog
	@Id INT
AS
BEGIN
	SELECT 
		ID,
		pass_average,
		[Date],
		ID_route
	FROM
		dbo.Route_log
	WHERE
		ID = @Id; 
	
END
GO

---SPs Delete dbo.RouteLog---
CREATE PROCEDURE spDeleteRouteLog
	@Id INT
AS
BEGIN
	DELETE FROM dbo.Route_log 	
	WHERE ID = @Id
END
GO

---------------------------------------------------------------- 

---SPs insert dbo.Town---
CREATE PROCEDURE spInsertTown
	@name VARCHAR(50)
AS
BEGIN
	INSERT INTO dbo.Town VALUES(
		@name
	);
END
GO

---SPs Update dbo.Town---
CREATE PROCEDURE spUpdateTown
	@Id INT,
	@name VARCHAR(50)
AS
BEGIN
	UPDATE dbo.Town 
	
	SET [Name] = @name
	
	WHERE ID = @Id
END
GO


---SPs Select dbo.Town---
CREATE PROCEDURE spSelectTown
	@Id INT
AS
BEGIN
	SELECT 
		ID,
		[Name]
	FROM
		dbo.Town
	WHERE
		ID = @Id; 
	
END

---SPs Delete dbo.Town---
CREATE PROCEDURE spDeleteTown
	@Id INT
AS
BEGIN TRY
	DELETE FROM dbo.Town 	
	WHERE ID = @Id
		
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() ErrorCodeNumber,
			ERROR_MESSAGE() [Message],
			ERROR_LINE() ErrorLine,
			ERROR_PROCEDURE() ProcedureError
END CATCH

GO

---------------------------------------------------------------- 

---SPs insert dbo.TypeBus---
CREATE PROCEDURE spInsertTypeBus
	@Desc VARCHAR(100)
AS
BEGIN
	INSERT INTO dbo.Type_bus VALUES(
		@Desc
	);
END
GO

---SPs Update dbo.TypeBus---
CREATE PROCEDURE spUpdateTypeBus
	@Id INT,
	@Desc VARCHAR(100)
AS
BEGIN
	UPDATE dbo.Type_bus
	
	SET [Description] = @Desc
	
	WHERE ID = @Id
END
GO

---SPs Select dbo.TypeBus---
CREATE PROCEDURE spSelectTypeBus
	@Id INT
AS
BEGIN
	SELECT 
		ID,
		[Description]
	FROM
		dbo.Type_bus
	WHERE
		ID = @Id; 
	
END
GO


---SPs Delete dbo.TypeBus---
CREATE PROCEDURE spDeleteTypeBus
	@Id INT
AS
BEGIN TRY
	DELETE FROM dbo.Type_bus 	
	WHERE ID = @Id
		
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() ErrorCodeNumber,
			ERROR_MESSAGE() [Message],
			ERROR_LINE() ErrorLine,
			ERROR_PROCEDURE() ProcedureError
END CATCH

GO

