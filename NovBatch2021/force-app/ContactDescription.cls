public with sharing class ContactDescription {
    public class ContactDiscription implements Database.Batchable<sObject >
{​​
public Database.QueryLocator start(Database.BatchableContext bc)
{​​
String conlist='SELECT id,Account.Name,Title,Description,Account.Description From Contact where AccountId !=null';
return Database.getQueryLocator(conlist);
}​​
public void execute(Database.BatchableContext bc, List<Contact> l)
{​​
if(l!=null)
{​​
for(Contact con:l)
{​​
con.Description=con.Title + ' of '+ con.Account.Name + ': ' +con.Account.Description;
}​​
update l;
}​​
}​​public void finish(Database.BatchableContext bc)
{​​}​​}​​

[10:46] Ramani Hema Ratna Kumar
ContactDescription c= new ContactDescription;Database.executeBatch(c);


}
