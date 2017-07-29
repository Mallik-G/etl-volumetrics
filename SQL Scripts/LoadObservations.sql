USE [ODS]
GO

/****** Object:  Table [LoadObservations]    Script Date: 3/19/2016 3:55:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[LoadObservations]') AND type in (N'U'))
BEGIN
CREATE TABLE [LoadObservations](
	[ObservationID] [int] IDENTITY(1,1) NOT NULL,
	[TableID] [int] NULL,
	[DateOfCurrentObservation] [datetime] NULL,
	[DateOfLastObservation] [datetime] NULL,
	[RowCount] [int] NULL,
	[ChangeFromLastObservation] [int] NULL,
	[CurrentThreeSDLevel] [numeric](18, 4) NULL,
 CONSTRAINT [PK_LoadObservations] PRIMARY KEY CLUSTERED 
(
	[ObservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_LoadObservations_Tables]') AND parent_object_id = OBJECT_ID(N'[LoadObservations]'))
ALTER TABLE [LoadObservations]  WITH CHECK ADD  CONSTRAINT [FK_LoadObservations_Tables] FOREIGN KEY([TableID])
REFERENCES [Tables] ([TableID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_LoadObservations_Tables]') AND parent_object_id = OBJECT_ID(N'[LoadObservations]'))
ALTER TABLE [LoadObservations] CHECK CONSTRAINT [FK_LoadObservations_Tables]
GO


