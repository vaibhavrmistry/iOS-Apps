//
//  ViewController.m
//  SegueDemo
//
//  Created by Vaibhav Mistry on 7/4/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation ViewController
@synthesize nameTextField=_nameTextField;

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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *vc2=(ViewController2 *)segue.destinationViewController;
    vc2.output=self.nameTextField.text;
}

@end
