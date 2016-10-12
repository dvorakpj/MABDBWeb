CREATE VIEW [dbo].[vw_NewBuyerAppAutoRejected]
	AS SELECT ba.* FROM [dbo].[vw_BuyerApplications] ba
	WHERE ba.AutoRejected is not null AND (( ba.AutoAccepted IS NULL) OR ( (ba.AutoAccepted IS NOT NULL) AND (ba.AutoAccepted < ba.AutoRejected) ))

