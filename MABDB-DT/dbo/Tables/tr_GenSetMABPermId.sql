CREATE TRIGGER [tr_GenSetMABPermId]
	ON [dbo].[Buyer]
	FOR INSERT
	AS
	BEGIN
		SET NOCOUNT ON
		UPDATE [dbo].[Buyer]
		SET MABuyerId = 'M' + CAST (Id As VARCHAR(20))
	END
