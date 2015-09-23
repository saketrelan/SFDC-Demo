trigger SyncEmployeeToUser on Employee__c (before insert, before update) {
if(trigger.isbefore)
{
if(trigger.isinsert || trigger.isupdate)
{
List<User> userList = [Select firstName,lastName,email,Phone from User];
for(Employee__c e: Trigger.new)
{
for(User u: userList)
{
if(e.Email_Id__c == u.Email)
{
u.LastName= e.Last_Name__c;
u.FirstName= e.First_Name__c;
u.Phone= e.Phone_Number__c;
}
}
}
update userList;
}
}
}