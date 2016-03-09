//
//  Issue.h
//  assignment10
//
//  Created by Vaibhav Mistry on 11/30/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Issue : NSObject

@property (nonatomic,strong) NSString *issueTitle;
@property (nonatomic,strong) NSString *issueDescription;
@property (nonatomic,strong) NSString *issueId;
@property (nonatomic,strong) NSString *issueNumber;
@property (nonatomic,strong) NSString *issueLoggedBy;
@property (nonatomic,strong) NSString *issueAssignedTo;
@property (nonatomic,strong) NSString *issueCreatedDate;
@property (nonatomic,strong) NSString *issueUpdatedDate;
@property (nonatomic,strong) NSString *issueClosedDate;
@property (nonatomic,strong) NSString *issueComments;
@property (nonatomic,strong) NSString *issueCommentsUrl;
@property bool isOpen;


-(Issue *)initWithTitle:(NSString *)title andDescription:(NSString *)description andId:(NSString *)issId andNumber:(NSString *)number andLoggedBy:(NSString *)loggedBy andAssignedTo:(NSString *)assignedTo andCreatedOn:(NSString *)createdOn andUpdatedAt:(NSString *)updatedAt andClosedOn:(NSString *)closedOn andIsOpen:(bool)openIndicator andComments:(NSString *)comments andCommentsUrl:(NSString *)url;

@end
