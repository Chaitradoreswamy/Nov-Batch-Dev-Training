trigger userTrigger on  user (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isAfter && Trigger.isInsert)
    {
        System.debug('Inside after insert-usre trigger');
        Set<Id> userIds=new Set<Id>();
        Profile legalProfile=[Select Id,Name FROM Profile WHERE Name = 'Custom: Marketing Profile' LIMIT 1];
        
        for(User user:Trigger.new)
        {
            if(user.ProfileId == legalProfile.Id)
            {
                userIds.add(user.Id);
            }
        }
        
        UserHandler.assignPermissionSet(userIds);
    }
}