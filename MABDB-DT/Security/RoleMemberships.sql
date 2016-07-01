ALTER ROLE [db_owner] ADD MEMBER [MABDB];


GO
ALTER ROLE [db_owner] ADD MEMBER [MABDBAppUser];


GO
ALTER ROLE [db_datareader] ADD MEMBER [MABDBAppUser];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [MABDBAppUser];

