//
//  ViewController.m
//  ViewDemo
//
//  Created by Vaibhav Mistry on 7/4/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()
//@property (strong, nonatomic) IBOutlet MyView *myView;
@property (strong, nonatomic) IBOutlet MyView *myView;

@end

@implementation ViewController
@synthesize myView=_myView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIGestureRecognizer *pinchGesture=[[UIPinchGestureRecognizer alloc] initWithTarget:self.myView action:@selector(pinchGesture:)];
    [self.view addGestureRecognizer:pinchGesture];
    
    
    UIGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc] initWithTarget:self.myView action:@selector(panGesture:)];
    [self.view addGestureRecognizer :panGesture] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
