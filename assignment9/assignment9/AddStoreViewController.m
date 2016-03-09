//
//  AddStoreViewController.m
//  assignment9
//
//  Created by Vaibhav Mistry on 11/18/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import "AddStoreViewController.h"
#import "StoreCD+StoreCDUtil.h"

@interface AddStoreViewController ()

@end

@implementation AddStoreViewController
@synthesize tapGestureRecognizer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (IBAction)addDetailsButtonClicked:(UIButton *)sender {
    
   

}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    //add validations
    if ( [_storeNameTxtField.text length]>0 && [_storeAddressTxtField.text length]>0 && [_storeZipTxtField.text length]>0 && [_storeTelephoneTxtField.text length]>0) {
        
        if ([[NSScanner scannerWithString:_storeZipTxtField.text] scanFloat:NULL]) {
            
            if ([[NSScanner scannerWithString:_storeTelephoneTxtField.text] scanFloat:NULL]) {
                //obtain the store details and store it
                
                
                
                //Convert String to NSNumber
                NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                f.numberStyle = NSNumberFormatterDecimalStyle;
                NSNumber *storeZip = [f numberFromString:self.storeZipTxtField.text];
                NSNumber *storeTelephone = [f numberFromString:self.storeTelephoneTxtField.text];
                
                //Add data to Core Data database
                NSDictionary *storeInfo = @{@"storeName":self.storeNameTxtField.text,
                                            @"storeAddress":self.storeAddressTxtField.text,
                                            @"storeZip":storeZip,
                                            @"storeTelephone":storeTelephone};
                
                //store it and NSLog it
                NSLog([StoreCD addStoreInfoFromDictionary:storeInfo].description);
                
                return YES;
                
            }
            else
            {
                //display an alert screen if non numeric data entered
                NSString *msg = [NSString stringWithFormat:@"Please enter numeric data for Telephone"];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                               delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                return NO;
            }
        }
        else
        {
            //display an alert screen if non numeric data entered
            NSString *msg = [NSString stringWithFormat:@"Please enter numeric data for zip-code"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                           delegate:self
                                                  cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            return NO;
        }
    }
    else
    {
        //display an alert screen if no details entered
        NSString *msg = [NSString stringWithFormat:@"One or more fields empty. Please enter all fields"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return NO;
        
    }
}





@end
