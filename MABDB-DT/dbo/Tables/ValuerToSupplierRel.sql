CREATE TABLE [dbo].[ValuerToSupplierRel]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [ValuerId] INT NOT NULL, 
    [ValuationSupplierId] INT NOT NULL, 
    [StartDate] NCHAR(10) NOT NULL, 
    [EndDate] NCHAR(10) NULL, 
    CONSTRAINT [FK_ValuerToSupplierRel_ToValuer] FOREIGN KEY ([ValuerId]) REFERENCES [Valuer]([Id]),	
	CONSTRAINT [FK_ValuerToSupplierRel_ToValuationSupplier] FOREIGN KEY ([ValuationSupplierId]) REFERENCES [ValuationSupplier]([Id])
)
