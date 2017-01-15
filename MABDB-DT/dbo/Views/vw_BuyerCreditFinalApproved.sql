CREATE VIEW [dbo].[vw_BuyerCreditFinalApproved]
	AS SELECT * FROM [dbo].[vw_Buyers] mab
	WHERE 
	mab.MAApprovedDate iS NOT NULL AND 
	MAStatus = 'A' 
	--AND
	--mab.FinalApprovedLimit$ >= mab.AppliedLimit$ 
	 
