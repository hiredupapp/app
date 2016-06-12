DROP INDEX EmailAddress_UNIQUE ON resources;
ALTER TABLE resources CHANGE EmailAddress UserName varchar(255);
ALTER TABLE resources ADD CONSTRAINT UQ_EmailAddress  UNIQUE (UserName);
ALTER TABLE resources ADD CONSTRAINT FK_resourceLocations FOREIGN KEY (LocationId) REFERENCES locations(LocationId);
ALTER TABLE resources ADD COLUMN LastLogin datetime NULL;
ALTER TABLE resources ADD COLUMN CreatedOn datetime NOT NULL;

describe resources;