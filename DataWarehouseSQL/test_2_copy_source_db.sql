USE [sep4_source_test]
GO

/****** Object:  Table [dbo].[Devices]    Script Date: 19-05-2022 13:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[ClimateDeviceId] [nvarchar](450) NOT NULL,
	[SettingsSettingId] [int] NULL,
	[RoomId] [int] NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[ClimateDeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurements]    Script Date: 19-05-2022 13:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurements](
	[MeasurementId] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [datetime2](7) NOT NULL,
	[Temperature] [real] NOT NULL,
	[Humidity] [int] NOT NULL,
	[Co2] [int] NOT NULL,
	[ClimateDeviceId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Measurements] PRIMARY KEY CLUSTERED 
(
	[MeasurementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 19-05-2022 13:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](450) NOT NULL,
	[SettingsSettingId] [int] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Rooms_RoomName] UNIQUE NONCLUSTERED 
(
	[RoomName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Settings]    Script Date: 19-05-2022 13:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[Co2Threshold] [int] NOT NULL,
	[HumidityThreshold] [int] NOT NULL,
	[TargetTemperature] [real] NOT NULL,
	[TemperatureMargin] [int] NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19-05-2022 13:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Actuator_ClimateDeviceId]    Script Date: 19-05-2022 13:49:27 ******/
CREATE NONCLUSTERED INDEX [IX_Actuator_ClimateDeviceId] ON [dbo].[Actuator]
(
	[ClimateDeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Devices_RoomId]    Script Date: 19-05-2022 13:49:27 ******/
CREATE NONCLUSTERED INDEX [IX_Devices_RoomId] ON [dbo].[Devices]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Devices_SettingsSettingId]    Script Date: 19-05-2022 13:49:27 ******/
CREATE NONCLUSTERED INDEX [IX_Devices_SettingsSettingId] ON [dbo].[Devices]
(
	[SettingsSettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Measurements_ClimateDeviceId]    Script Date: 19-05-2022 13:49:27 ******/
CREATE NONCLUSTERED INDEX [IX_Measurements_ClimateDeviceId] ON [dbo].[Measurements]
(
	[ClimateDeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_SettingsSettingId]    Script Date: 19-05-2022 13:49:27 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_SettingsSettingId] ON [dbo].[Rooms]
(
	[SettingsSettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sensor_ClimateDeviceId]    Script Date: 19-05-2022 13:49:27 ******/
CREATE NONCLUSTERED INDEX [IX_Sensor_ClimateDeviceId] ON [dbo].[Sensor]
(
	[ClimateDeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

