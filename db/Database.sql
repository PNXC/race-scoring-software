DROP TABLE IF EXISTS event_result;
DROP TABLE IF EXISTS event_medal_tag;
DROP TABLE IF EXISTS event_registration_tag;
DROP TABLE IF EXISTS event_registration;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS tag_type;

IF OBJECT_ID('dbo.Person', 'U') IS NOT NULL
BEGIN
    ALTER TABLE Person
    SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Person;
	DROP TABLE person_history;
END
GO

CREATE TABLE [person] (
  [person_id] int PRIMARY KEY IDENTITY(1, 1),
  [first_name] nvarchar(255),
  [last_name] nvarchar(255),
  [email] nvarchar(255),
  [phone_number] nvarchar(255),
  [mom_person_id] int,
  [dad_person_id] int,
  [entry_user] nvarchar(255) NOT NULL DEFAULT SUSER_SNAME(),
  [entry_datetime] datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
  [change_user] nvarchar(255) NULL,
  [change_datetime] datetime2 NULL,
  [ValidFrom] datetime2 GENERATED ALWAYS AS ROW START NOT NULL,
  [ValidTo] datetime2 GENERATED ALWAYS AS ROW END NOT NULL,
  PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.person_history));
GO

CREATE TABLE [tag_type] (
  [tag_type_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [entry_user] nvarchar(255) NOT NULL DEFAULT SUSER_SNAME(),
  [entry_datetime] datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
  [change_user] nvarchar(255) NULL,
  [change_datetime] datetime2 NULL
);
GO

CREATE TABLE [tag] (
  [tag_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [tag_type_id] int,
  [entry_user] nvarchar(255) NOT NULL DEFAULT SUSER_SNAME(),
  [entry_datetime] datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
  [change_user] nvarchar(255) NULL,
  [change_datetime] datetime2 NULL
);
GO

CREATE TABLE [event] (
  [event_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [event_date] date,
  [location] nvarchar(255),
  [entry_user] nvarchar(255) NOT NULL DEFAULT SUSER_SNAME(),
  [entry_datetime] datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
  [change_user] nvarchar(255) NULL,
  [change_datetime] datetime2 NULL
);
GO

CREATE TABLE [event_registration] (
  [event_registration_id] int PRIMARY KEY IDENTITY(1, 1),
  [event_id] int,
  [person_id] int,
  [entry_user] nvarchar(255) NOT NULL DEFAULT SUSER_SNAME(),
  [entry_datetime] datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
  [change_user] nvarchar(255) NULL,
  [change_datetime] datetime2 NULL
);
GO

CREATE TABLE [event_result] (
  [event_result_id] int PRIMARY KEY IDENTITY(1, 1),
  [event_id] int,
  [person_id] int,
  [time_seconds] int,
  [ordinal] int,
  [entry_user] nvarchar(255) NOT NULL DEFAULT SUSER_SNAME(),
  [entry_datetime] datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
  [change_user] nvarchar(255) NULL,
  [change_datetime] datetime2 NULL
);
GO

CREATE TABLE [event_registration_tag] (
  [event_registration_tag_id] int PRIMARY KEY IDENTITY(1, 1),
  [event_registration_id] int,
  [tag_id] int,
  [entry_user] nvarchar(255) NOT NULL DEFAULT SUSER_SNAME(),
  [entry_datetime] datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
  [change_user] nvarchar(255) NULL,
  [change_datetime] datetime2 NULL
);
GO

CREATE TABLE [event_medal_tag] (
  [event_medal_tag_id] int PRIMARY KEY IDENTITY(1, 1),
  [event_id] int,
  [tag_type_id] int,
  [number_medals] int,
  [score_type] char(1), -- 'I' (Score as Individual), 'T' (Score as Team)
  [entry_user] nvarchar(255) NOT NULL DEFAULT SUSER_SNAME(),
  [entry_datetime] datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
  [change_user] nvarchar(255) NULL,
  [change_datetime] datetime2 NULL
);
GO

ALTER TABLE [tag] ADD FOREIGN KEY ([tag_type_id]) REFERENCES [tag_type] ([tag_type_id]);
ALTER TABLE [event_result] ADD FOREIGN KEY ([event_id]) REFERENCES [event] ([event_id]);
ALTER TABLE [event_result] ADD FOREIGN KEY ([person_id]) REFERENCES [person] ([person_id]);
ALTER TABLE [event_registration] ADD FOREIGN KEY ([event_id]) REFERENCES [event] ([event_id]);
ALTER TABLE [event_registration] ADD FOREIGN KEY ([person_id]) REFERENCES [person] ([person_id]);

ALTER TABLE [event_registration_tag] ADD FOREIGN KEY ([event_registration_id]) REFERENCES [event_registration] ([event_registration_id]);
ALTER TABLE [event_registration_tag] ADD FOREIGN KEY ([tag_id]) REFERENCES [tag] ([tag_id]);
ALTER TABLE [event_medal_tag] ADD FOREIGN KEY ([event_id]) REFERENCES [event] ([event_id]);
ALTER TABLE [event_medal_tag] ADD FOREIGN KEY ([tag_type_id]) REFERENCES [tag_type] ([tag_type_id]);
GO
