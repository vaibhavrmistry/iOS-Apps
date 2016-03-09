//
//  ViewController.m
//  FlickrDemo
//
//  Created by Vaibhav Mistry on 7/19/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

@implementation ViewController
@synthesize myImageView=_myImageView;
@synthesize image=_image;
@synthesize indicatorView=_indicatorView;
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

-(void)setImage:(UIImage *)image
{
    _image=image;
    self.myImageView.image=image;
}

@end
