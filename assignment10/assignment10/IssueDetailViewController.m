//
//  IssueDetailViewController.m
//  assignment10
//
//  Created by Vaibhav Mistry on 11/30/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import "IssueDetailViewController.h"


@interface IssueDetailViewController ()

@end

@implementation IssueDetailViewController
@synthesize issue,issueAssignedToLabel,issueClosedOnLabel,issueCreatedOnLabel,issueDescLabel,issueIdLabel,issueLoggedByLabel,issueNumberLabel,issueTitleLabel,issueUpdatedAtLabel,closedOnLabel,commentsLabel,commentsUrlLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    issueTitleLabel.text = [NSString stringWithFormat:@"%@", issue.issueTitle];
    issueDescLabel.text = [NSString stringWithFormat:@"%@", issue.issueDescription];
    issueIdLabel.text = [NSString stringWithFormat:@"%@", issue.issueId];
    issueNumberLabel.text = [NSString stringWithFormat:@"%@", issue.issueNumber];
    issueAssignedToLabel.text = [NSString stringWithFormat:@"%@", issue.issueAssignedTo];
    issueLoggedByLabel.text = [NSString stringWithFormat:@"%@", issue.issueLoggedBy];
    issueCreatedOnLabel.text = [NSString stringWithFormat:@"%@", issue.issueCreatedDate];
    issueUpdatedAtLabel.text = [NSString stringWithFormat:@"%@", issue.issueUpdatedDate];
    commentsUrlLabel.text =[NSString stringWithFormat:@"%@", issue.issueCommentsUrl];
    commentsLabel.text =[NSString stringWithFormat:@"%@", issue.issueComments];

    if (issue.issueClosedDate != nil) {
        issueClosedOnLabel.text = [NSString stringWithFormat:@"%@", issue.issueClosedDate];
    }
    else{
        [issueClosedOnLabel setHidden:YES];
        issueClosedOnLabel.hidden = YES;
        closedOnLabel.hidden = YES;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation






@end
