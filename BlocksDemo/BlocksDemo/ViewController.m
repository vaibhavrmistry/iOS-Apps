//
//  ViewController.m
//  BlocksDemo
//
//  Created by Vaibhav Mistry on 7/27/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation ViewController
@synthesize myView=_myView;

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

-(void)viewDidLayoutSubviews
{
    [UIView animateWithDuration:3 animations:^{
        [self.myView setAlpha:0.2];
        [self.myView setFrame:CGRectMake(200, 200, self.myView.bounds.size.width, self.myView.bounds.size.height)];
    }];
}
@end
