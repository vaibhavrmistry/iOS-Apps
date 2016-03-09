//
//  ViewController.m
//  FirstApp
//
//  Created by Vaibhav Mistry on 7/2/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UILabel *outputData;


@end

@implementation ViewController
@synthesize submitButton=_submitButton;
@synthesize outputData=_outputData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitButtonChanged:(UIButton *)sender {
    
    
}

@end
