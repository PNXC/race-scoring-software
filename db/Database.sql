CREATE TABLE [person] (
  [person_id] int PRIMARY KEY IDENTITY(1, 1),
  [first_name] nvarchar(255),
  [last_name] nvarchar(255),
  [email] nvarchar(255),
  [phone_number] nvarchar(255)
)
GO

CREATE TABLE [tag_type] (
  [tag_type_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255)
)
GO

CREATE TABLE [tag] (
  [tag_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [tag_type_id] int
)
GO

CREATE TABLE [person_tag] (
  [person_tag_id] int PRIMARY KEY IDENTITY(1, 1),
  [person_id] int,
  [tag_id] int
)
GO

CREATE TABLE [event] (
  [event_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [event_date] date
)
GO

CREATE TABLE [event_result] (
  [event_result_id] int PRIMARY KEY IDENTITY(1, 1),
  [event_id] int,
  [person_id] int,
  [time_seconds] int,
  [ordinal] int
)
GO

CREATE TABLE [family] (
  [family_id] int PRIMARY KEY IDENTITY(1, 1),
  [family_name] nvarchar(255)
)
GO

CREATE TABLE [person_family] (
  [person_family_id] int PRIMARY KEY IDENTITY(1, 1),
  [person_id] int,
  [family_id] int,
  [role] nvarchar(255)
)
GO

ALTER TABLE [person_tag] ADD FOREIGN KEY ([person_id]) REFERENCES [person] ([person_id])
GO

ALTER TABLE [person_tag] ADD FOREIGN KEY ([tag_id]) REFERENCES [tag] ([tag_id])
GO

ALTER TABLE [tag] ADD FOREIGN KEY ([tag_type_id]) REFERENCES [tag_type] ([tag_type_id])
GO

ALTER TABLE [event_result] ADD FOREIGN KEY ([event_id]) REFERENCES [event] ([event_id])
GO

ALTER TABLE [event_result] ADD FOREIGN KEY ([person_id]) REFERENCES [person] ([person_id])
GO

ALTER TABLE [person_family] ADD FOREIGN KEY ([family_id]) REFERENCES [family] ([family_id])
GO

ALTER TABLE [person_family] ADD FOREIGN KEY ([person_id]) REFERENCES [person] ([person_id])
GO
