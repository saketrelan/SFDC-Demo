public class queryEx
{
    public static PageReference practice()
        {
            Account a=new Account(name='asfe');
            Account b=[select id from Account where name= 'sfdfhe'];
            
            PageReference pr=new PageReference('/apex/my123');
            pr.setRedirect(true);            
            return pr;                    
        }
}