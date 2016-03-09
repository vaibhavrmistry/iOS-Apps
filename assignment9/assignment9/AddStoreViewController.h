//
//  AddStoreViewController.h
//  assignment9
//
//  Created by Vaibhav Mistry on 11/18/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddStoreViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *storeNameTxtField;
@property (strong, nonatomic) IBOutlet UITextField *storeAddressTxtField;
@property (strong, nonatomic) IBOutlet UITextField *storeZipTxtField;
@property (strong, nonatomic) IBOutlet UITextField *storeTelephoneTxtField;
- (IBAction)addDetailsButtonClicked:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;

@end
