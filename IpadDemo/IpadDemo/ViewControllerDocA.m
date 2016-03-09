//
//  ViewControllerDocA.m
//  IpadDemo
//
//  Created by Vaibhav Mistry on 7/6/14.
//  Copyright (c) 2014 Vaibhav. All rights reserved.
//

#import "ViewControllerDocA.h"
#import "ViewControllerCircle.h"
@interface ViewControllerDocA ()

@property (nonatomic,strong) ViewControllerCircle *circleVC;

@end

@implementation ViewControllerDocA

@synthesize circleVC=_circleVC;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.circleVC=(ViewControllerCircle *)[self.splitViewController.viewControllers lastObject];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewControllerCircle *vcCircle = (ViewControllerCircle *)segue.destinationViewController;
    if([segue.identifier isEqualToString:@"DocA4Times"] )
    vcCircle.userScale=0.8;
    else if([segue.identifier isEqualToString:@"DocA2Times"] )
        vcCircle.userScale=0.5;
    else vcCircle.userScale=0.3;

}
- (IBAction)fourTimesClicked:(id)sender
{
    self.circleVC.userScale=0.8;
    
}

- (IBAction)twoTimesClicked:(id)sender
{
    self.circleVC.userScale=0.5;
}

- (IBAction)oneTimeClicked:(id)sender
{
    self.circleVC.userScale=0.3;
}









@end
