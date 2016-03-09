//
//  Issue.m
//  assignment10
//
//  Created by Vaibhav Mistry on 11/30/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import "Issue.h"

@implementation Issue
@synthesize issueAssignedTo,issueClosedDate,issueCreatedDate,issueDescription,issueId,issueLoggedBy,issueTitle,issueUpdatedDate,issueNumber;


-(Issue *)initWithTitle:(NSString *)title andDescription:(NSString *)description andId:(NSString *)issId andNumber:(NSString *)number andLoggedBy:(NSString *)loggedBy andAssignedTo:(NSString *)assignedTo andCreatedOn:(NSString *)createdOn andUpdatedAt:(NSString *)updatedAt andClosedOn:(NSString *)closedOn andIsOpen:(bool)openIndicator andComments:(NSString *)comments andCommentsUrl:(NSString *)url
{
    Issue *issue = [[Issue alloc]init];
    
    self.issueTitle = title;
    self.issueDescription = description;
    self.issueId = issId;
    self.issueNumber = number;
    self.issueLoggedBy = loggedBy;
    self.issueCreatedDate = createdOn;
    self.issueUpdatedDate = updatedAt;
    self.isOpen = openIndicator;
    self.issueComments = comments;
    self.issueCommentsUrl = url;
    
    if (assignedTo) {
        self.issueAssignedTo = assignedTo;
    }
    else{
        self.issueAssignedTo = @"Not Assigned";
    }
    
    if (closedOn) {
        self.issueClosedDate = closedOn;
    }
    else{
        self.issueClosedDate = @"Issue Open";
    }
    
    issue = self;
    
    return issue;
}


@end
