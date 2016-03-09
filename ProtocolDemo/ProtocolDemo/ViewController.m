//
//  ViewController.m
//  ProtocolDemo
//
//  Created by Vaibhav Mistry on 7/6/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()<myViewDelegate>
//@property (strong, nonatomic) IBOutlet MyView *myView;
@property (strong, nonatomic) IBOutlet MyView *myView;
@property (nonatomic) float userScale;

@end

@implementation ViewController
@synthesize myView=_myView;
@synthesize userScale=_userScale;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.myView.delegate=self;
    
    UIGestureRecognizer *pinchGesture=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
    [self.myView addGestureRecognizer:pinchGesture];
    
    UIGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc] initWithTarget:self.myView action:@selector(panGesture:)];
    [self.view addGestureRecognizer :panGesture] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pinchGesture:(UIPinchGestureRecognizer *) gesture
{
    self.userScale=gesture.scale;
    [self.myView setNeedsDisplay];
}

-(float)getUserScale
{
    if(!self.userScale)
        return 1;
    return self.userScale;
}


@end
