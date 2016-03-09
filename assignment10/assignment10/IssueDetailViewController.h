//
//  IssueDetailViewController.h
//  assignment10
//
//  Created by Vaibhav Mistry on 11/30/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Issue.h"

@interface IssueDetailViewController : UIViewController
@property (nonatomic,strong) Issue * issue;
@property (strong, nonatomic) IBOutlet UILabel *issueTitleLabel;
@property (strong, nonatomic) IBOutlet UITextView *issueDescLabel;
@property (strong, nonatomic) IBOutlet UILabel *issueIdLabel;
@property (strong, nonatomic) IBOutlet UILabel *issueNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *issueLoggedByLabel;
@property (strong, nonatomic) IBOutlet UILabel *issueAssignedToLabel;
@property (strong, nonatomic) IBOutlet UILabel *issueCreatedOnLabel;
@property (strong, nonatomic) IBOutlet UILabel *issueUpdatedAtLabel;
@property (strong, nonatomic) IBOutlet UILabel *issueClosedOnLabel;
@property (strong, nonatomic) IBOutlet UILabel *closedOnLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentsLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentsUrlLabel;

@end
