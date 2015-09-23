public class custOpp {    
    public String stages { get; set; }
    public Opportunity oppty { get; set; }

    public List<Opportunity> getOpportunityList() {
        List<Opportunity> opp = [Select Name,AccountId,CloseDate,Probability from Opportunity where StageName =:stages AND OwnerId =:UserInfo.getUserId()];
        return opp;
    }

     public PageReference submit() {
        Opportunity opportunity1= new Opportunity();
        opportunity1.Name = 'saket';
        opportunity1.CloseDate = System.Today();
        opportunity1.StageName = 'Closed Won';
        opportunity1.Account = oppty.Account; 
         insert opportunity1;   
        return null;
    }


}