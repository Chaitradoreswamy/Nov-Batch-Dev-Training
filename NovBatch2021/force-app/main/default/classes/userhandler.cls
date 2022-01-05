public with sharing class userhandler {
    public userhandler() {
        @future
    public static void assignPermissionSet(Set<Id> userIds)
    {
        System.debug('Inside the future method');
        Permissionset permset = [SELECT Id, Name FROM PermissionSet WHERE Name = 'Marketing_user_Permission' LIMIT 1];
        List<PermissionSetAssignment> newPermissions = new List<PermissionSetAssignment>();
        for(Id userID:userIds)
        {
            
            PermissionSetAssignment oPermissionSetAssignment = new PermissionSetAssignment();
            oPermissionSetAssignment.PermissionSetId = permset.Id;
            oPermissionSetAssignment.AssigneeId = userId;
            newPermissions.add(oPermissionSetAssignment);
        }
        if(newPermissions !=null)
        {
            insert newPermissions;
        }
    }

    }
}
