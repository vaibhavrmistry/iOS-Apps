//
//  ViewController.m
//  AlertDemo
//
//  Created by Vaibhav Mistry on 8/2/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

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
- (IBAction)alertClicked:(id)sender {
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Sample Alert" message:@"This is sample Alert" delegate:self cancelButtonTitle:@"Remove" otherButtonTitles:@"Add 1",@"Add 2", nil];
    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button clicked %d",buttonIndex);
}

@end
