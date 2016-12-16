
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/02/2016 15:21:06
-- Generated from EDMX file: C:\Users\rgunn007\Source\Repos\ImageManager\ImageManager\ImageManagerData\IMDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [IMDB_TEST];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Packages'
CREATE TABLE [dbo].[Packages] (
    [PackageId] int IDENTITY(1,1) NOT NULL,
    [PackageGuid] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Photos'
CREATE TABLE [dbo].[Photos] (
    [PhotoId] int IDENTITY(1,1) NOT NULL,
    [PackageId] int  NOT NULL,
    [PhotoGuid] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [PackagePhoto_Photo_PackageId] int  NOT NULL
);
GO

-- Creating table 'Ratings'
CREATE TABLE [dbo].[Ratings] (
    [RatingId] int IDENTITY(1,1) NOT NULL,
    [PhotoId] int  NOT NULL,
    [Rate] time  NOT NULL,
    [AuditCreated_CreatedDate] datetime  NOT NULL,
    [AuditCreated_CreatedBy] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Paths'
CREATE TABLE [dbo].[Paths] (
    [PathId] int IDENTITY(1,1) NOT NULL,
    [PackageId] int  NOT NULL,
    [Directory] nvarchar(max)  NOT NULL,
    [AuditDetails_MetaUpdated_UpdatedBy] nvarchar(max)  NOT NULL,
    [AuditDetails_MetaUpdated_UpdatedDate] datetime  NOT NULL,
    [AuditDetails_MetaCreated_CreatedDate] datetime  NOT NULL,
    [AuditDetails_MetaCreated_CreatedBy] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PackageId] in table 'Packages'
ALTER TABLE [dbo].[Packages]
ADD CONSTRAINT [PK_Packages]
    PRIMARY KEY CLUSTERED ([PackageId] ASC);
GO

-- Creating primary key on [PhotoId] in table 'Photos'
ALTER TABLE [dbo].[Photos]
ADD CONSTRAINT [PK_Photos]
    PRIMARY KEY CLUSTERED ([PhotoId] ASC);
GO

-- Creating primary key on [RatingId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [PK_Ratings]
    PRIMARY KEY CLUSTERED ([RatingId] ASC);
GO

-- Creating primary key on [PathId] in table 'Paths'
ALTER TABLE [dbo].[Paths]
ADD CONSTRAINT [PK_Paths]
    PRIMARY KEY CLUSTERED ([PathId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PackageId] in table 'Paths'
ALTER TABLE [dbo].[Paths]
ADD CONSTRAINT [FK_PackagePath]
    FOREIGN KEY ([PackageId])
    REFERENCES [dbo].[Packages]
        ([PackageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PackagePath'
CREATE INDEX [IX_FK_PackagePath]
ON [dbo].[Paths]
    ([PackageId]);
GO

-- Creating foreign key on [PhotoId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_RatingPhoto]
    FOREIGN KEY ([PhotoId])
    REFERENCES [dbo].[Photos]
        ([PhotoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RatingPhoto'
CREATE INDEX [IX_FK_RatingPhoto]
ON [dbo].[Ratings]
    ([PhotoId]);
GO

-- Creating foreign key on [PackagePhoto_Photo_PackageId] in table 'Photos'
ALTER TABLE [dbo].[Photos]
ADD CONSTRAINT [FK_PackagePhoto]
    FOREIGN KEY ([PackagePhoto_Photo_PackageId])
    REFERENCES [dbo].[Packages]
        ([PackageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PackagePhoto'
CREATE INDEX [IX_FK_PackagePhoto]
ON [dbo].[Photos]
    ([PackagePhoto_Photo_PackageId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------