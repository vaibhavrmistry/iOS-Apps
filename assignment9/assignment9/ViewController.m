//
//  ViewController.m
//  assignment9
//
//  Created by Vaibhav Mistry on 11/18/15.
//  Copyright (c) 2015 Vaibhav Mistry. All rights reserved.
//

#import "ViewController.h"
#import "StoreCD+StoreCDUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)clickHereButtonClicked:(UIButton *)sender {
    StoreCD * temp = [StoreCD getStoreFromDatabase];
    
    if(temp.storeName)
    {
        [self performSegueWithIdentifier:@"mainMenuSegue" sender:nil];
        
    }
    
    else
        
    {
        [self performSegueWithIdentifier:@"storeDetailsSegue" sender:nil];
    }
    
    
}
@end
