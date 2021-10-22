IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CW1].[CheckIns]') AND type in (N'U'))
DROP TABLE [CW1].[CheckIns]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CW1].[Accommodation]') AND type in (N'U'))
DROP TABLE [CW1].[Accommodation]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CW1].[Maintenance]') AND type in (N'U'))
DROP TABLE [CW1].[Maintenance]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CW1].[Customer]') AND type in (N'U'))
DROP TABLE [CW1].[Customer]
GO
