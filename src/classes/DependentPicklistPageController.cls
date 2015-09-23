public class DependentPicklistPageController
{
    public String state {get;set;}
    public String district {get;set;}
    public List<SelectOption> getStates()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','--- None ---'));        
        options.add(new SelectOption('Mp','Madhya Pradesh'));
        options.add(new SelectOption('UP','Uttar Pradesh'));
        options.add(new SelectOption('MH','Maharashtra'));
        options.add(new SelectOption('GJ','Gujarat'));        
        return options;
    } 
    
    public List<SelectOption> getdistricts()
    {
        List<SelectOption> options = new List<SelectOption>();
        if(state == 'MH')
        {       
            options.add(new SelectOption('MUM','Mumbai'));
            options.add(new SelectOption('PN','Pune'));
        }
        else
        {
            options.add(new SelectOption('None','--- None ---'));
        }      
        return options;
    }       
}