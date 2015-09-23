public with sharing class myclass {

public string sampleDateField {get; set;}

PageReference saveaction()
    {
        return new PageReference('/apex/');    
    }
}