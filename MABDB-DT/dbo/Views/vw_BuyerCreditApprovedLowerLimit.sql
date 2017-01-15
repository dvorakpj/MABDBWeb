﻿CREATE VIEW [dbo].[vw_BuyerCreditApprovedLowerLimit]
	AS SELECT * FROM [dbo].[vw_BuyerCreditFinalApproved] mab
	WHERE 
	--mab.MAApprovedDate iS NOT NULL AND 
	--MAStatus = 'A' AND
	mab.FinalApprovedLimit$ < mab.AppliedLimit$ 
	 
