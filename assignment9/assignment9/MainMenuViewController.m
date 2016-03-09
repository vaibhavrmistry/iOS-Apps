//
//  MainMenuViewController.m
//  assignment9
//
//  Created by Vaibhav Mistry on 11/18/15.
//  Copyright © 2015 Vaibhav Mistry. All rights reserved.
//

#import "MainMenuViewController.h"
#import "StoreCD+StoreCDUtil.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController
@synthesize storeNameDisplayLabel,storeAddressDisplayLabel,storeTelephoneDisplayLabel,storeZipDisplayLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    //get store from database
    StoreCD *store = [StoreCD getStoreFromDatabase];
    
    
    
    
    
    //set display labels
    storeNameDisplayLabel.text = store.storeName;
    storeAddressDisplayLabel.text = store.storeAddress;
    storeZipDisplayLabel.text = [NSString stringWithFormat:@"%@", store.storeZip];
    storeTelephoneDisplayLabel.text = [NSString stringWithFormat:@"%@", store.storeTelephone];
    
    
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

@end
