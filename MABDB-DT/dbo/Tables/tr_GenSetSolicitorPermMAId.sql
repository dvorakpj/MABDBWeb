CREATE TRIGGER [tr_GenSetSolicitorPermMAId]
	ON [dbo].[Solicitor]
	FOR INSERT
	AS
	BEGIN
		SET NOCOUNT ON
		UPDATE [dbo].[Solicitor]
		SET MASolicitorId = 'M' + CAST (Id As VARCHAR(20))
		WHERE MASolicitorId IS NULL
	END
