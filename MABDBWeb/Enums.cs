namespace MABDBWeb
{

    enum ScoreClass
    {
        Undefined,
        Reject,
        Bronze,
        Silver,
        Gold,
        Platinum,
    }


    enum AutoCondApprovalResult
    {
        Accepted = 'A',
        Rejected = 'R',
        Referred = 'F'
    }

    enum CondCreditDecisionResult
    {
        Accepted = 'A',
        AcceptedLowerPrtyValLimit = 'L',
        Rejected = 'R',
    }

}