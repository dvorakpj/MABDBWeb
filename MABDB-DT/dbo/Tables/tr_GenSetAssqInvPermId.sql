CREATE TRIGGER [tr_GenSetAssqInvPermId]
	ON [dbo].[Investor]
	FOR INSERT
	AS
	BEGIN
		SET NOCOUNT ON
		UPDATE [dbo].[Investor]
		SET MAInvestorId = 'M' + CAST (Id As VARCHAR(20))
	END
