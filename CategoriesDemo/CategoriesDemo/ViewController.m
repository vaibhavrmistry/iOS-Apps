//
//  ViewController.m
//  CategoriesDemo
//
//  Created by Vaibhav Mistry on 8/2/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+DisplayArray.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4", nil];
  
    [array displayArray];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
