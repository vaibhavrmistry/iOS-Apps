//
//  ViewController.h
//  assignment10
//
//  Created by Vaibhav Mistry on 11/28/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate>
@property (strong, nonatomic) IBOutlet UITableView *issueListTableView;


@end

