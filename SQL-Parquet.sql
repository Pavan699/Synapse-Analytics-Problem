IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'synapsedemo_pavan0699_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [synapsedemo_pavan0699_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://synapsedemo@pavan0699.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE UserData (
	[registration_dttm] datetime2(7),
	[id] int,
	[first_name] nvarchar(4000),
	[last_name] nvarchar(4000),
	[email] nvarchar(4000),
	[gender] nvarchar(4000),
	[ip_address] nvarchar(4000),
	[cc] nvarchar(4000),
	[country] nvarchar(4000),
	[birthdate] nvarchar(4000),
	[salary] float,
	[title] nvarchar(4000),
	[comments] nvarchar(4000)
	)
	WITH (
	LOCATION = 'userdata1.parquet',
	DATA_SOURCE = [synapsedemo_pavan0699_dfs_core_windows_net],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


SELECT TOP 100 * FROM dbo.UserData
GO

SELECT COUNT(*) FROM UserData